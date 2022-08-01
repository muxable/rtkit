

import 'package:shared_preferences/shared_preferences.dart';
class ThemePreferences{ 
 static const pref ='pref_key';
  setTheme(bool value)async{ 
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool(pref, value);
  }
  getTheme()async{ 
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.getBool(pref);
  }


}



