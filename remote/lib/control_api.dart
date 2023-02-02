import 'package:http/http.dart' as http;

const baseURL = "https://kit.rtirl.com/api/";

void startStreaming(String channelId) {
  http.post(Uri.parse("$baseURL$channelId/startStreaming"),
      body: "[]", headers: {"content-type": "application/json"});
}

void stopStreaming(String channelId) {
  http.post(Uri.parse("$baseURL$channelId/stopStreaming"),
      body: "[]", headers: {"content-type": "application/json"});
}

void startRecording(String channelId) {
  http.post(Uri.parse("$baseURL$channelId/startRecording"),
      body: "[]", headers: {"content-type": "application/json"});
}

void stopRecording(String channelId) {
  http.post(Uri.parse("$baseURL$channelId/stopRecording"),
      body: "[]", headers: {"content-type": "application/json"});
}

void startReplayBuffer(String channelId) {
  http.post(Uri.parse("$baseURL$channelId/startReplayBuffer"),
      body: "[]", headers: {"content-type": "application/json"});
}

void stopReplayBuffer(String channelId) {
  http.post(Uri.parse("$baseURL$channelId/stopReplayBuffer"),
      body: "[]", headers: {"content-type": "application/json"});
}

void saveReplayBuffer(String channelId) {
  http.post(Uri.parse("$baseURL$channelId/saveReplayBuffer"),
      body: "[]", headers: {"content-type": "application/json"});
}

void setCurrentScene(String channelId, String sceneName) {
  http.post(Uri.parse("$baseURL$channelId/setCurrentScene"),
      body: "[\"$sceneName\"]", headers: {"content-type": "application/json"});
}

void setCurrentTransition(String channelId, String transitionName) {
  http.post(Uri.parse("$baseURL$channelId/setCurrentTransition"),
      body: "[\"$transitionName\"]",
      headers: {"content-type": "application/json"});
}
