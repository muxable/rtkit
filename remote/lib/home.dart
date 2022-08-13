import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:remote/operations.dart';
import 'package:remote/qr_code.dart';
import 'package:provider/provider.dart';
import 'package:remote/size.dart';
import 'package:remote/status.dart';
import 'package:remote/variables.dart';
import 'theme_model.dart';
import 'package:remote/storage_util.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final uuidController = TextEditingController();
  _setText() async {
    setState(() {
      uuid = uuidController.text;
      StorageUtil.putString("uuid", uuid!);
      fetchuuid();
      if (kDebugMode) {
        print(uuid);
      }

      // ignore: unnecessary_brace_in_string_interps
    });
  }

  fetchuuid() async {
    String s = "https://kit.rtirl.com/api/$uuid/activeAgentId";

    final response = await http.get(Uri.parse(s));

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Operations()));

      // If the server did return a 200 OK response,
      // then parse the JSON.

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Invalid uuid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text('Real Time Kit'),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Status()));
                },
                icon: const Icon(Icons.space_dashboard_sharp),
              ),
              actions: [
                Transform.scale(
                    scale: 0.7,
                    child: IconButton(
                        onPressed: () {
                          /*
            ThemeModeHandler.of(context)!.saveThemeMode(ThemeMode.dark); //Dark theme
ThemeModeHandler.of(context)!.saveThemeMode(ThemeMode.light); //Light theme
ThemeModeHandler.of(context)!.saveThemeMode(ThemeMode.system); //System theme
*/

                          themeNotifier.isDark
                              ? themeNotifier.isDark = false
                              : themeNotifier.isDark = true;
                        },
                        icon: Icon(themeNotifier.isDark
                            ? Icons.wb_sunny
                            : Icons.nightlight_round)))
              ]),
          body: SizedBox(
              height: displayHeight(context) -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,
              width: displayWidth(context),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: displayHeight(context) * 0.05,
                      width: displayWidth(context) * 0.9,
                    ),
                    // const Flexible(fit: FlexFit.tight, child: SizedBox()),
                    Center(
                      child: Image.asset(
                        'images/logo.png',
                        height: displayHeight(context) * 0.1,
                        width: displayWidth(context) * 0.2,
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.05,
                      width: displayWidth(context) * 0.9,
                    ),
                    //const Flexible(fit: FlexFit.tight, child: SizedBox()),
                    Center(
                        child: Text('OBS studio Real time kit',
                            style: TextStyle(
                                fontSize: displayHeight(context) * 0.025,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 29, 14, 14)))),
                    SizedBox(
                      height: displayHeight(context) * 0.05,
                      width: displayWidth(context) * 0.9,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: displayHeight(context) * 0.05,
                            width: displayWidth(context) * 0.7,
                            child: FloatingActionButton.extended(
                              icon: const Icon(Icons.camera_alt),
                              label: const Text("Scan"),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Qrcode()));
                              },
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: displayHeight(context) * 0.01,
                      width: displayWidth(context) * 0.9,
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.05,
                      width: displayWidth(context) * 0.7,
                      child: const Center(
                          child: Text('OR',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 29, 14, 14)))),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.01,
                      width: displayWidth(context) * 0.9,
                    ),
                    // ignore: sized_box_for_whitespace
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: displayHeight(context) * 0.05,
                            width: displayWidth(context) * 0.9,
                            child: TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Enter the UUID ',
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10)),
                              controller: uuidController,
                              maxLines: 5,
                              minLines: 1,
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: displayHeight(context) * 0.05,
                      width: displayWidth(context) * 0.9,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: displayHeight(context) * 0.05,
                            width: displayWidth(context) * 0.5,
                            child: ElevatedButton(
                                onPressed: _setText,
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(3),
                                ),
                                //  backgroundColor: MaterialStateProperty.all(Colors.blue)),
                                child: const Text('Submit')),
                          ),
                        ]),
                  ])));
    });
  }
}