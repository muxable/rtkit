import { Navigate, useParams } from "solid-app-router";
import { Component, lazy, Match, Switch } from "solid-js";
import { validate } from "uuid";
const OBSAgent = lazy(() => import("./OBSAgent"));
const DebugAgent = lazy(() => import("./DebugAgent"));

const Agent: Component = () => {
  const params = useParams();
  return (
    <Switch>
      <Match when={!params.id || !validate(params.id)}>
        <Navigate href="/" />
      </Match>
      <Match when={window.obsstudio}>
        <OBSAgent channelId={params.id} />
      </Match>
      <Match when={true}>
        <DebugAgent channelId={params.id} />
      </Match>
    </Switch>
  );
};

export default Agent;
