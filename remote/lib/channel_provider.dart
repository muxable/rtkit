import 'package:flutter/material.dart';
import 'package:rtkit/app_preferences.dart';

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
    return await preferences.getChannelId();
  }
}
