import 'package:http/http.dart' as http;

class ControlAPI {
  final baseURL = "https://kit.rtirl.com/api/";

  void startStreaming(String channelId) {
    http.post(Uri.parse("$baseURL$channelId/startStreaming"));
  }

  void stopStreaming(String channelId) {
    http.post(Uri.parse("$baseURL$channelId/stopStreaming"));
  }

  void startRecording(String channelId) {
    http.post(Uri.parse("$baseURL$channelId/startRecording"));
  }

  void stopRecording(String channelId) {
    http.post(Uri.parse("$baseURL$channelId/stopRecording"));
  }

  void startReplayBuffer(String channelId) {
    http.post(Uri.parse("$baseURL$channelId/startReplayBuffer"));
  }

  void stopReplayBuffer(String channelId) {
    http.post(Uri.parse("$baseURL$channelId/stopReplayBuffer"));
  }

  void saveReplayBuffer(String channelId) {
    http.post(Uri.parse("$baseURL$channelId/saveReplayBuffer"));
  }

  void setCurrentScene(String channelId, String sceneName) {
    http.post(Uri.parse("$baseURL$channelId/setCurrentScene"),
        body: "[\"$sceneName\"]",
        headers: {"content-type": "application/json"});
  }

  void setCurrentTransition(String channelId, String transitionName) {
    http.post(Uri.parse("$baseURL$channelId/setCurrentTransition"),
        body: "[\"$transitionName\"]",
        headers: {"content-type": "application/json"});
  }
}
