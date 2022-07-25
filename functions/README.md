# RealtimeKit's API

## Retrieve Channel Information
You can retrieve information about a channel like this:

```javascript
fetch(`https://kit.rtirl.com/api/${channelId}/${fieldName}`);
```

Where `${fieldName}` can be:
- `activeAgentId`
- `obsRecording`
- `obsReplaybuffer`
- `obsScene`
- `obsScenes`
- `obsSourceActive`
- `obsSourceVisible`
- `obsStreaming`
- `obsTransition`
- `obsTransitions`
- `obsVirtualcam`
- `updatedAt`

And `${channelId}` is the channel id generated when opening the web app. This is a v4 UUID. See how it's generated [here](https://github.com/muxable/rtkit/blob/825ce08e9c8e452f4cf44c700de3b2dce39ea805/web/src/Home.tsx#L7)

See more about the response [here](https://github.com/muxable/rtkit/blob/main/web/src/OBSAgent.tsx).

## Execute actions

Currently, the API only supports these commands:

- Replay Buffer
	- `saveReplayBuffer`
	- `startReplayBuffer`
- Streaming
	- `startStreaming`
	- `stopStreaming`
- Recording
	- `startRecording`
	- `stopRecording`
	- `pauseRecording`
	- `unpauseRecording`
- Virtual Camera
	- `startVirtualcam`
	- `stopVirtualcam`
- Scene Selection
	- `setCurrentScene`
- Transition Selection
	- `setCurrentTransition`

The general format to perform an action is like this:

```js
fetch(`https://kit.rtirl.com/api/${channelId}/${command}`, {
  "headers": {
    "content-type": "application/json",
  },
  "body": "[]",
  "method": "POST",
});
```

*Note:* The body currently has to be present, so for most commands it will be `[]`
The only actions that currently support payloads are `setCurrentScene` and `setCurrentTransition`. These would look like: 

```js
fetch(`https://kit.rtirl.com/api/${channelId}/setCurrentTransition`, {
  "headers": {
    "content-type": "application/json",
  "body": "[\"Cut\"]",
  "method": "POST",
});
```
The body must be one of the options returned in the matching fields, so for this example the response to the request for the field `obsTransitions` was `["Cut", "Fade"]`, so those would be the possibilities for the body.