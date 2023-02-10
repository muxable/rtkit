import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rtkit/control_screen.dart';
import 'package:rtkit/firebase_options.dart';
import 'package:rtkit/home.dart';
import 'package:rtkit/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();

  runApp(
    MyApp(
      prefs: prefs,
    ),
  );
}

class MyApp extends StatefulWidget {
  final SharedPreferences prefs;

  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String? _channelId;

  @override
  void initState() {
    super.initState();

    _channelId = widget.prefs.getString('channelId');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.mainTheme,
      debugShowCheckedModeBanner: false,
      title: 'RealtimeKit',
      home: _channelId != null
          ? ControlScreen(channelId: _channelId!, prefs: widget.prefs)
          : MainPage(prefs: widget.prefs),
    );
  }
}
