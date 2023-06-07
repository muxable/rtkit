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
      <div><h1>RealtimeKit</h1></div>
      <div><h2>Control OBS remotely without setting up obs-websocket</h2></div>
      <div>Add a browser source in OBS: <Link href={`/${uuid()}`}>{uuid()}</Link></div>
      <img
        src={`https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${url()}`}
        alt="qr code"
      />
      <div>Make sure it's configured like this:</div>
      <img src={obsSettingsImg} alt="configuration" />
      <div>Download a control app</div>
      <a
        href="https://play.google.com/store/apps/details?id=com.rtirl.chat&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1"
        ><img
          alt="Get it on Google Play"
          src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"
          width="300"
      /></a>
      <a
        href="https://apps.apple.com/app/id1567720948"
        ><img
          id="app-store"
          alt="Download on the app store"
          src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg"
          width="245"
      /></a>
      {/* <Link
        href="https://play.google.com/store/apps/details?id=com.rtirl.kit"
        target="_blank"
      >
        Android
      </Link>
      <br />
      <Link
        href="https://apps.apple.com/us/app/realtimekit/id6443628121"
        target="_blank"
      >
        iOS
      </Link> */}
      <br />
      <div><Link href={`/${uuid()}`}>Web Interface</Link> (most reliable)</div>
      <div>Make a new app with the API</div>
      <div>
        Ask on <a href="https://discord.gg/UKHJMQs74u">discord</a>,
        documentation isn't done yet.
      </div>
    </div>
  );
};

export default Home;
