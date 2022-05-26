import { Component, createMemo } from "solid-js";
import { v4 as uuidv4 } from "uuid";

const Home: Component = () => {
  const uuid = createMemo(() => uuidv4());
  return (
    <div>
      <div>RealtimeKit</div>
      <div>Add a browser source in OBS: kit.rtirl.com/{uuid()}</div>
      <div>Download a control app.</div>
    </div>
  );
};

export default Home;
