import { Link } from "solid-app-router";
import { Component, createMemo } from "solid-js";
import { v4 as uuidv4 } from "uuid";
import obsSettingsImg from "./assets/obs-settings.png";

const Home: Component = () => {
  const uuid = createMemo(() => uuidv4());
  const url = createMemo(
    () => encodeURIComponent(window.location.origin) + "/" + uuid()
  );
  return (
    <div>
      <div>RealtimeKit</div>
      <div>Add a browser source in OBS: https://kit.rtirl.com/{uuid()}</div>
      <img
        src={`https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${url()}`}
        alt="qr code"
      />
      <div>Make sure it's configured like this:</div>
      <img src={obsSettingsImg} alt="configuration" />
      <div>Download a control app.</div>
      <Link href="https://play.google.com/store/apps/details?id=com.rtirl.kit" target="_blank">Android</Link>
      <br/>
      <Link href={`/${uuid()}`}>Web Interface</Link>
      <div>Make a new app with the API</div>
      <div>Ask on <a href="https://discord.gg/UKHJMQs74u">discord</a>{" "}, documentation isn't done yet.</div>
    </div>
  );
};

export default Home;
