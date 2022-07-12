// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';
class ThemePreferences{ 
  static const PREF_KEY ='pref_key';
  setTheme(bool value)async{ 
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, value);
  }
  getTheme()async{ 
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.getBool(PREF_KEY);
  }


}



