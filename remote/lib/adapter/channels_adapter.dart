import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChannelStatus {
  /// Recording status
  final String obsRecording;

  ///  Replay buffer status
  final String obsReplayBuffer;

  /// Streaming status
  final String obsStreaming;

  /// Virtual cam status
  final String obsVirtualcam;

  /// Indicates the current scene
  final ActiveScene obsScene;

  /// List of available scenes
  final List<String> obsScenes;

  final bool obsSourceActive;
  final bool obsSourceVisible;

  /// Current transition
  final String obsTransition;

  /// List of available transitions
  final List<String> obsTransitions;

  ChannelStatus(
      {required this.obsRecording,
      required this.obsReplayBuffer,
      required this.obsScene,
      required this.obsScenes,
      required this.obsSourceActive,
      required this.obsSourceVisible,
      required this.obsStreaming,
      required this.obsTransition,
      required this.obsTransitions,
      required this.obsVirtualcam});
}

class ActiveScene {
  final String name;
  final num width;
  final num height;

  ActiveScene({required this.name, required this.width, required this.height});
}

class ChannelsAdapter {
  final FirebaseFirestore db;

  ChannelsAdapter._({required this.db});

  static ChannelsAdapter get instance =>
      _instance ??= ChannelsAdapter._(db: FirebaseFirestore.instance);
  static ChannelsAdapter? _instance;

  Stream<ChannelStatus> retrieveChannelStatus(String channelId) {
    final query = db.collection('channels').doc(channelId);
    return query.snapshots().map((snapshot) {
      final channelInfo = snapshot.data() as Map<String, dynamic>;
      return ChannelStatus(
        obsRecording: channelInfo['obsRecording'] as String,
        obsReplayBuffer: channelInfo['obsReplaybuffer'] as String,
        obsScene: ActiveScene(
            height: channelInfo['obsScene']['height'] as num,
            name: channelInfo['obsScene']['name'] as String,
            width: channelInfo['obsScene']['width'] as num),
        obsScenes: List.from(channelInfo['obsScenes']),
        obsSourceActive: channelInfo['obsSourceActive']['active'] as bool,
        obsSourceVisible: channelInfo['obsSourceVisible']['visible'] as bool,
        obsStreaming: channelInfo['obsStreaming'] as String,
        obsTransition: channelInfo['obsTransition'] as String,
        obsTransitions: List.from(channelInfo['obsTransitions']),
        obsVirtualcam: channelInfo['obsVirtualcam'] as String,
      );
    });
  }
}
