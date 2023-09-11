import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  late SharedPreferences _prefs;

  AppPreferences();

  Future<void> getSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> storeChannelId(String channelId) async {
    await getSharedPreferences();
    _prefs.setString('channelId', channelId);
  }

  Future<String?> getChannelId() async {
    try {
      await getSharedPreferences();
      return _prefs.getString('channelId');
    } catch (e) {
      return '';
    }
  }
}
