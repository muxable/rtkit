import {
  collection,
  doc,
  DocumentReference,
  getFirestore,
  limitToLast,
  onSnapshot,
  orderBy,
  query,
  setDoc,
  serverTimestamp,
  updateDoc,
  where,
} from "@firebase/firestore";
import {
  Component,
  createEffect,
  createMemo,
  createSignal,
  Show,
} from "solid-js";
import { styled } from "solid-styled-components";
import { v4 as uuidv4 } from "uuid";
import { app } from "./firebase";

const Inactive = styled("div")`
  background-color: red;
  height: 100%;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 32px;
  padding: 24px;
  box-sizing: border-box;
`;

const Warning = styled("div")`
  background-color: orange;
  height: 100%;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 32px;
  padding: 24px;
  box-sizing: border-box;
`;

const Success = styled("div")`
  background-color: green;
  height: 100%;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 32px;
  padding: 24px;
  box-sizing: border-box;
`;

function arrayEquals(a: string[], b: string[]) {
  if (a.length != b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      return false;
    }
  }
  return true;
}

function synchronize(ref: DocumentReference) {
  const onObsSceneChanged = (event: Event & CustomEvent<OBSSceneInfo>) => {
    updateDoc(ref, {
      obsScene: {
        name: event.detail.name,
        width: event.detail.width,
        height: event.detail.height,
      },
    });
  };
  const onObsSourceVisibleChanged = (
    event: Event & CustomEvent<VisibleInfo>
  ) => {
    updateDoc(ref, {
      obsSourceVisible: {
        visible: event.detail.visible,
      },
    });
  };
  const onObsSourceActiveChanged = (event: Event & CustomEvent<ActiveInfo>) => {
    updateDoc(ref, {
      obsSourceActive: {
        active: event.detail.active,
      },
    });
  };
  const onObsStreamingStarting = () =>
    updateDoc(ref, { obsStreaming: "starting", updatedAt: serverTimestamp() });
  const onObsStreamingStarted = () =>
    updateDoc(ref, { obsStreaming: "started", updatedAt: serverTimestamp() });
  const onObsStreamingStopping = () =>
    updateDoc(ref, { obsStreaming: "stopping", updatedAt: serverTimestamp() });
  const onObsStreamingStopped = () =>
    updateDoc(ref, { obsStreaming: "stopped", updatedAt: serverTimestamp() });
  const onObsRecordingStarting = () =>
    updateDoc(ref, { obsRecording: "starting", updatedAt: serverTimestamp() });
  const onObsRecordingStarted = () =>
    updateDoc(ref, { obsRecording: "started", updatedAt: serverTimestamp() });
  const onObsRecordingPaused = () =>
    updateDoc(ref, { obsRecording: "paused", updatedAt: serverTimestamp() });
  const onObsRecordingUnpaused = () =>
    updateDoc(ref, { obsRecording: "started", updatedAt: serverTimestamp() });
  const onObsRecordingStopping = () =>
    updateDoc(ref, { obsRecording: "stopping", updatedAt: serverTimestamp() });
  const onObsRecordingStopped = () =>
    updateDoc(ref, { obsRecording: "stopped", updatedAt: serverTimestamp() });
  const onObsReplaybufferStarting = () =>
    updateDoc(ref, {
      obsReplaybuffer: "starting",
      updatedAt: serverTimestamp(),
    });
  const onObsReplaybufferStarted = () =>
    updateDoc(ref, {
      obsReplaybuffer: "started",
      updatedAt: serverTimestamp(),
    });
  const onObsReplaybufferStopping = () =>
    updateDoc(ref, {
      obsReplaybuffer: "stopping",
      updatedAt: serverTimestamp(),
    });
  const onObsReplaybufferStopped = () =>
    updateDoc(ref, {
      obsReplaybuffer: "stopped",
      updatedAt: serverTimestamp(),
    });
  const onObsVirtualcamStarted = () =>
    updateDoc(ref, { obsVirtualcam: "started", updatedAt: serverTimestamp() });
  const onObsVirtualcamStopped = () =>
    updateDoc(ref, { obsVirtualcam: "stopped", updatedAt: serverTimestamp() });
  const onObsExit = () =>
    updateDoc(ref, { activeAgentId: null, updatedAt: serverTimestamp() });

  window.addEventListener("obsSceneChanged", onObsSceneChanged);
  window.addEventListener("obsSourceVisibleChanged", onObsSourceVisibleChanged);
  window.addEventListener("obsSourceActiveChanged", onObsSourceActiveChanged);
  window.addEventListener("obsStreamingStarting", onObsStreamingStarting);
  window.addEventListener("obsStreamingStarted", onObsStreamingStarted);
  window.addEventListener("obsStreamingStopping", onObsStreamingStopping);
  window.addEventListener("obsStreamingStopped", onObsStreamingStopped);
  window.addEventListener("obsRecordingStarting", onObsRecordingStarting);
  window.addEventListener("obsRecordingStarted", onObsRecordingStarted);
  window.addEventListener("obsRecordingPaused", onObsRecordingPaused);
  window.addEventListener("obsRecordingUnpaused", onObsRecordingUnpaused);
  window.addEventListener("obsRecordingStopping", onObsRecordingStopping);
  window.addEventListener("obsRecordingStopped", onObsRecordingStopped);
  window.addEventListener("obsReplaybufferStarting", onObsReplaybufferStarting);
  window.addEventListener("obsReplaybufferStarted", onObsReplaybufferStarted);
  window.addEventListener("obsReplaybufferStopping", onObsReplaybufferStopping);
  window.addEventListener("obsReplaybufferStopped", onObsReplaybufferStopped);
  window.addEventListener("obsVirtualcamStarted", onObsVirtualcamStarted);
  window.addEventListener("obsVirtualcamStopped", onObsVirtualcamStopped);
  window.addEventListener("obsExit", onObsExit);

  let stop = false;

  function periodic(f: () => void) {
    const schedule = () => {
      setTimeout(() => {
        if (stop) {
          return;
        }
        f();
        schedule();
      }, 1000);
    };
    f();
    schedule();
  }

  window.obsstudio.getControlLevel((level) => {
    if (stop) {
      return;
    }
    updateDoc(ref, { obsControlLevel: level });

    if (level < 1) {
      return;
    }
    window.obsstudio.getStatus((status) => {
      if (stop) {
        return;
      }
      updateDoc(ref, {
        obsRecording: status.recording
          ? status.recordingPaused
            ? "paused"
            : "started"
          : "stopped",
        obsStreaming: status.streaming ? "started" : "stopped",
        obsReplaybuffer: status.replaybuffer ? "started" : "stopped",
        obsVirtualcam: status.virtualcam ? "started" : "stopped",
      });
    });
    if (level < 2) {
      return;
    }
    window.obsstudio.getCurrentScene((scene) => {
      if (stop) {
        return;
      }
      updateDoc(ref, { obsScene: scene });
    });
    let prevTransition: string;
    periodic(() => {
      window.obsstudio.getCurrentTransition((transition) => {
        if (stop) {
          return;
        }
        if (transition != prevTransition) {
          updateDoc(ref, { obsTransition: transition });
        }
        prevTransition = transition;
      });
    });
    let prevScenes: string[] = [];
    periodic(() => {
      window.obsstudio.getScenes((scenes) => {
        if (stop) {
          return;
        }
        if (!arrayEquals(scenes, prevScenes)) {
          updateDoc(ref, { obsScenes: scenes });
        }
        prevScenes = scenes;
      });
    });
    let prevTransitions: string[] = [];
    periodic(() => {
      window.obsstudio.getTransitions((transitions) => {
        if (stop) {
          return;
        }
        if (!arrayEquals(transitions, prevTransitions)) {
          updateDoc(ref, { obsTransitions: transitions });
        }
        prevTransitions = transitions;
      });
    });
  });

  return () => {
    stop = true;
    window.removeEventListener("obsSceneChanged", onObsSceneChanged);
    window.removeEventListener(
      "obsSourceVisibleChanged",
      onObsSourceVisibleChanged
    );
    window.removeEventListener(
      "obsSourceActiveChanged",
      onObsSourceActiveChanged
    );
    window.removeEventListener("obsStreamingStarting", onObsStreamingStarting);
    window.removeEventListener("obsStreamingStarted", onObsStreamingStarted);
    window.removeEventListener("obsStreamingStopping", onObsStreamingStopping);
    window.removeEventListener("obsStreamingStopped", onObsStreamingStopped);
    window.removeEventListener("obsRecordingStarting", onObsRecordingStarting);
    window.removeEventListener("obsRecordingStarted", onObsRecordingStarted);
    window.removeEventListener("obsRecordingPaused", onObsRecordingPaused);
    window.removeEventListener("obsRecordingUnpaused", onObsRecordingUnpaused);
    window.removeEventListener("obsRecordingStopping", onObsRecordingStopping);
    window.removeEventListener("obsRecordingStopped", onObsRecordingStopped);
    window.removeEventListener(
      "obsReplaybufferStarting",
      onObsReplaybufferStarting
    );
    window.removeEventListener(
      "obsReplaybufferStarted",
      onObsReplaybufferStarted
    );
    window.removeEventListener(
      "obsReplaybufferStopping",
      onObsReplaybufferStopping
    );
    window.removeEventListener(
      "obsReplaybufferStopped",
      onObsReplaybufferStopped
    );
    window.removeEventListener("obsVirtualcamStarted", onObsVirtualcamStarted);
    window.removeEventListener("obsVirtualcamStopped", onObsVirtualcamStopped);
    window.removeEventListener("obsExit", onObsExit);
  };
}

function listen(ref: DocumentReference, agentId: string) {
  return onSnapshot(
    query(
      collection(ref, "commands"),
      where("agentId", "==", agentId),
      orderBy("createdAt"),
      limitToLast(1)
    ),
    async (snapshot) => {
      for (const change of snapshot.docChanges()) {
        const level = await new Promise<OBSControlLevel>((resolve) =>
          window.obsstudio.getControlLevel(resolve)
        );
        switch (change.doc.get("command")) {
          case "saveReplayBuffer":
            if (level < 3) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.saveReplayBuffer();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "startReplayBuffer":
            if (level < 4) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.startReplayBuffer();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "stopReplayBuffer":
            if (level < 4) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.stopReplayBuffer();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "setCurrentScene": {
            if (change.doc.get("args")?.length != 1) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "INVALID_ARGUMENT",
              });
              break;
            }
            const arg = change.doc.get("args")[0];
            if (typeof arg !== "string") {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "INVALID_ARGUMENT",
              });
              break;
            }
            if (level < 4) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.setCurrentScene(arg);
            await updateDoc(change.doc.ref, { success: true });
            break;
          }
          case "setCurrentTransition": {
            if (change.doc.get("args")?.length != 1) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "INVALID_ARGUMENT",
              });
              break;
            }
            const arg = change.doc.get("args")[0];
            if (typeof arg !== "string") {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "INVALID_ARGUMENT",
              });
              break;
            }
            if (level < 4) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.setCurrentTransition(arg);
            await updateDoc(change.doc.ref, { success: true });
            break;
          }
          case "startStreaming":
            if (level < 5) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.startStreaming();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "stopStreaming":
            if (level < 5) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.stopStreaming();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "startRecording":
            if (level < 5) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.startRecording();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "stopRecording":
            if (level < 5) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.stopRecording();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "pauseRecording":
            if (level < 5) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.pauseRecording();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "unpauseRecording":
            if (level < 5) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.unpauseRecording();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "startVirtualcam":
            if (level < 5) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.startVirtualcam();
            await updateDoc(change.doc.ref, { success: true });
            break;
          case "stopVirtualcam":
            if (level < 5) {
              await updateDoc(change.doc.ref, {
                success: false,
                error: "CONTROL_LEVEL",
              });
              break;
            }
            window.obsstudio.stopVirtualcam();
            await updateDoc(change.doc.ref, { success: true });
            break;
        }
      }
    }
  );
}

const OBSAgent: Component<{ channelId: string }> = ({ channelId }) => {
  const agentId = createMemo(() => uuidv4());
  const ref = createMemo(() => doc(getFirestore(app), "channels", channelId));

  const [isActive, setActive] = createSignal<boolean | null>(null);

  const [level, setLevel] = createSignal(5);

  const [isMessageShowing, setMessageShowing] = createSignal(false);

  createEffect(() => {
    return onSnapshot(ref(), (doc) => {
      setActive(doc.get("activeAgentId") == agentId());
    });
  });

  createEffect(() => {
    setDoc(ref(), { activeAgentId: agentId() }, { merge: true });
  });

  createEffect(() => {
    if (isActive()) {
      return synchronize(ref());
    }
  });

  createEffect(() => {
    if (isActive()) {
      return listen(ref(), agentId());
    }
  });

  createEffect(() => {
    window.obsstudio.getControlLevel((level) => {
      setLevel(level);
      setMessageShowing(true);
    });
  });

  createEffect(() => {
    if (isMessageShowing()) {
      const timeout = setTimeout(
        () => setMessageShowing(false),
        level() < 5 ? 60 * 1000 : 5 * 1000
      );
      return () => clearTimeout(timeout);
    }
  });

  return (
    <Show
      when={isActive() === false}
      fallback={
        <Show
          when={level() < 5 && isMessageShowing()}
          fallback={
            <Show when={isMessageShowing()}>
              <Success>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-6 w-6"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  stroke-width="2"
                  width="96"
                  height="96"
                  style="margin-right: 24px"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                  />
                </svg>
                This browser source is correctly configured.
                <br />
                This message will disappear in 5 seconds.
              </Success>
            </Show>
          }
        >
          <Warning>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-6 w-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
              width="96"
              height="96"
              style="margin-right: 24px"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"
              />
            </svg>
            This browser source doesn't have enough permissions. See
            kit.rtirl.com for instructions.
            <br />
            This warning will disappear in 60 seconds.
          </Warning>
        </Show>
      }
    >
      <Inactive>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="h-6 w-6"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          stroke-width="2"
          width="96"
          height="96"
          style="margin-right: 24px"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
          />
        </svg>
        This browser source is inactive and should be removed.
      </Inactive>
    </Show>
  );
};

export default OBSAgent;
