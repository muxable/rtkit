import { Navigate, useParams } from "solid-app-router";
import { Component, createEffect, createSignal, For } from "solid-js";
import { validate } from "uuid";
import OBSAgent from "./OBSAgent";
import { getFirestore, doc, onSnapshot } from "@firebase/firestore";

const commands = [
  "saveReplayBuffer",
  "startReplayBuffer",
  "startStreaming",
  "stopStreaming",
  "startRecording",
  "pauseRecording",
  "unpauseRecording",
  "startVirtualcam",
  "stopVirtualcam",
];

const Agent: Component = () => {
  const params = useParams();
  if (!params.id || !validate(params.id)) {
    return <Navigate href="/" />;
  }
  if (window.obsstudio) {
    return <OBSAgent channelId={params.id} />;
  }
  const [state, setState] = createSignal<any>();

  createEffect(() => {
    return onSnapshot(doc(getFirestore(), "channels", params.id), (doc) =>
      setState(doc.data())
    );
  });

  return (
    <div>
      <div>This is a debug page for {params.id}</div>
      <pre>{JSON.stringify(state(), Object.keys(state()).sort(), 4)}</pre>
      <div>Switch Scenes</div>
      <For each={(state()?.obsScenes as string[]) || []}>
        {(item) => {
          return (
            <button
              onClick={() => {
                fetch(`/api/${params.id}/setCurrentScene`, {
                  method: "POST",
                  headers: { "Content-Type": "application/json" },
                  body: JSON.stringify([item]),
                });
              }}
            >
              {item}
            </button>
          );
        }}
      </For>
      <div>Switch Transitions</div>
      <For each={(state()?.obsTransitions as string[]) || []}>
        {(item) => {
          return (
            <button
              onClick={() => {
                fetch(`/api/${params.id}/setCurrentTransition`, {
                  method: "POST",
                  headers: { "Content-Type": "application/json" },
                  body: JSON.stringify([item]),
                });
              }}
            >
              {item}
            </button>
          );
        }}
      </For>
      <div>Auxiliary Commands</div>
      <For each={commands}>
        {(item) => {
          return (
            <button
              onClick={() => {
                fetch(`/api/${params.id}/${commands}`, { method: "POST" });
              }}
            >
              {item}
            </button>
          );
        }}
      </For>
    </div>
  );
};

export default Agent;
