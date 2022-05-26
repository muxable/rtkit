import { doc, getFirestore, onSnapshot } from "@firebase/firestore";
import { Component, createEffect, createSignal, For } from "solid-js";
import { app } from "./firebase";

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

const DebugAgent: Component<{ channelId: string }> = ({ channelId }) => {
  const [state, setState] = createSignal<any>();

  createEffect(() => {
    return onSnapshot(doc(getFirestore(app), "channels", channelId), (doc) =>
      setState(doc.data())
    );
  });

  return (
    <div>
      <div>This is a debug page for {channelId}</div>
      <pre>{JSON.stringify(state(), Object.keys(state() ?? {}).sort(), 4)}</pre>
      <div>Switch Scenes</div>
      <For each={(state()?.obsScenes as string[]) || []}>
        {(item) => {
          return (
            <button
              onClick={() => {
                fetch(`/api/${channelId}/setCurrentScene`, {
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
                fetch(`/api/${channelId}/setCurrentTransition`, {
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
                fetch(`/api/${channelId}/${commands}`, { method: "POST" });
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

export default DebugAgent;
