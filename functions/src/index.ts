import * as cors from "cors";
import * as functions from "firebase-functions";
import * as express from "express";
import * as admin from "firebase-admin";
import { validate } from "uuid";

admin.initializeApp();

const app = express();

app.use(cors({ origin: true }));
app.use(express.json());

app.get("/api/:channelId/:fieldName", async (req, res) => {
  const channelId = req.params.channelId;
  const fieldName = req.params.fieldName;
  if (!validate(channelId) || !fieldName) {
    res.status(400).send();
    return;
  }
  const doc = await admin
    .firestore()
    .collection("channels")
    .doc(channelId)
    .get();
  const value = doc.get(fieldName);
  if (value === undefined) {
    res.status(400).send();
    return;
  }
  res.status(200).send(value);
});

const validCommands = [
  "saveReplayBuffer",
  "startReplayBuffer",
  "setCurrentScene",
  "setCurrentTransition",
  "startStreaming",
  "stopStreaming",
  "startRecording",
  "pauseRecording",
  "unpauseRecording",
  "startVirtualcam",
  "stopVirtualcam",
];

app.post("/api/:channelId/:command", async (req, res) => {
  const channelId = req.params.channelId;
  const command = req.params.command;
  const args = req.body || [];
  if (
    !validate(channelId) ||
    !validCommands.includes(command) ||
    !Array.isArray(args)
  ) {
    res.status(400).send();
    return;
  }
  const doc = await admin
    .firestore()
    .collection("channels")
    .doc(channelId)
    .get();
  const agentId = doc.get("activeAgentId");
  if (!agentId) {
    res.status(503).send();
    return;
  }
  const ref = await admin
    .firestore()
    .collection("channels")
    .doc(channelId)
    .collection("commands")
    .add({
      agentId,
      command,
      args,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    });
  const unsubscribe = ref.onSnapshot((doc) => {
    if (doc.get("success") === undefined) {
      return;
    }
    unsubscribe();
    if (doc.get("success")) {
      res.status(200).send();
    } else {
      switch (doc.get("error")) {
        case "CONTROL_LEVEL":
          res.status(503).send();
          break;
        case "INVALID_ARGUMENT":
          res.status(400).send();
          break;
      }
    }
  });
});

export const api = functions.https.onRequest(app);
