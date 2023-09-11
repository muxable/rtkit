import 'package:flutter/material.dart';
import 'package:rtkit/components/app_preferences.dart';

class ChannelModel extends ChangeNotifier {
  AppPreferences preferences;
  String? _channelId;

  ChannelModel({required this.preferences});

  Future<void> setChannelId(String newChannelId) async {
    await preferences.storeChannelId(newChannelId);
    _channelId = newChannelId;

    notifyListeners();
  }

  Future<String?> getChannelId() async {
    _channelId = await preferences.getChannelId();
    return _channelId;
  }
}
