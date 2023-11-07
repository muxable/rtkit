import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rtkit/components/app_preferences.dart';
import 'package:rtkit/components/channel_provider.dart';
import 'package:rtkit/screens/control_screen.dart';
import 'package:rtkit/firebase_options.dart';
import 'package:rtkit/screens/home.dart';
import 'package:rtkit/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ChannelModel(preferences: AppPreferences()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.mainTheme,
      debugShowCheckedModeBanner: false,
      title: 'RealtimeKit',
      home: Consumer<ChannelModel>(
        builder: (context, value, child) => FutureBuilder<String?>(
          future: value.getChannelId(),
          builder: (context, snapshot) {
            final channelId = snapshot.data;

            if (channelId == null) {
              return const MainPage();
            }

            return ControlScreen(channelId: channelId);
          },
        ),
      ),
    );
  }
}
