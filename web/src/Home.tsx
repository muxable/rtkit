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
      <h1>RealtimeKit</h1>
      <h2>Control OBS remotely without setting up obs-websocket</h2>
      <div>Add a browser source in OBS: <Link target="_blank" href={`/${uuid()}`}>https://kit.rtirl.com/{uuid()}</Link></div>
      <img
        src={`https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${url()}`}
        alt="qr code"
      />
      <div>Make sure it's configured like this:</div>
      <img src={obsSettingsImg} alt="configuration" />
      <div>Download a control app</div>
      <Link
        href="https://play.google.com/store/apps/details?id=com.rtirl.chat&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1"
        target="_blank"><img
        id="google-play"
        alt="Get it on Google Play"
        src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"
        width="300"
      /></Link>
      <br />
      <Link
        href="https://apps.apple.com/app/id1567720948"
        target="_blank"><img
        id="app-store"
        alt="Download on the app store"
        src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg"
        width="245"
      /></Link>
      <br />
      <div>Scan the QR code in the app and enjoy</div>
      <div>The app might have some delays for best reliability use the <Link href={`/${uuid()}`} target="_blank">Web Interface</Link> and save the link for later</div>
      <div><Link href={`/${uuid()}`} target="_blank">Web Interface</Link> (most reliable)</div>
      <div>Make a new app with the API</div>
      <div>
        Ask on <a href="https://discord.gg/UKHJMQs74u">discord</a>,
        documentation isn't done yet.
      </div>
    </div>
  );
};

export default Home;
