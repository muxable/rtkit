import 'package:flutter/material.dart';
import 'package:remote/home.dart';
import 'package:provider/provider.dart';
import 'theme_model.dart';
import 'package:remote/storage_util.dart';



//void main() => runApp(const MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer(
          builder: (context, ThemeModel themeNotifier, child) {
            return MaterialApp(
              theme:
                  themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
              debugShowCheckedModeBanner: false,
              title: 'Real Time Kit',
              home: const MainPage(),
            );
          },
        ));
  }
}






