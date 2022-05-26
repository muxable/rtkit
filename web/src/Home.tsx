import { Component, createMemo } from "solid-js";
import { v4 as uuidv4 } from "uuid";

const Home: Component = () => {
    const uuid = createMemo(() => uuidv4());
    const url = createMemo(
      () => encodeURIComponent(window.location.origin) + "/" + uuid()
    );
    return (
      <div>
        <div>RealtimeKit</div>
        <div>Add a browser source in OBS: kit.rtirl.com/{uuid()}</div>
        <img
          src={`https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${url()}`}
          alt="qr code"
        />
        <div>Download a control app.</div>
      </div>
    );
};

export default Home;
