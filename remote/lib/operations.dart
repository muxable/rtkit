// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:remote/home.dart';
import 'package:remote/scenesnew.dart';
import 'package:remote/status.dart';
import 'package:remote/storage_util.dart';
import 'package:remote/variables.dart';

class Operations extends StatefulWidget {
  const Operations({Key? key}) : super(key: key);

  @override
  State<Operations> createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  //final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Operations"),
        centerTitle: true,
        actions: [
          Transform.scale(
              scale: 0.7,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                icon: const Icon(Icons.home_filled),
              )) //icon data for elevated button
        ],
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                ElevatedButton.icon(
                    onPressed: () async {
                      _displayDialog(context);
                    },
                    icon: const Icon(Icons
                        .settings_input_antenna), //icon data for elevated button
                    label: const Text("Start/Stop Streaming"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 233, 82, 71),
                    )),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("uuid");
                      String u =
                          "https://kit.rtirl.com/api/$uuid/startRecording";
                      String u1 =
                          "https://kit.rtirl.com/api/$uuid/obsRecording";
                      String u2 =
                          "https://kit.rtirl.com/api/$uuid/stopRecording";
                      // print(u);
                      Uri uri = Uri.parse(u);
                      Uri uri1 = Uri.parse(u1);
                      Uri uri2 = Uri.parse(u2);
                      final Response res1 = await get(uri1);
                      // print(res1.body);
                      //final jsonData=jsonDecode(res1.body);
                      // print(jsonData);
                      if (res1.body == 'stopped') {
                        Response res = await http.post(uri,
                            body: "[]",
                            headers: {"content-type": "application/json"});
                        //   print(res.statusCode);
                      } else {
                        Response res = await http.post(uri2,
                            body: "[]",
                            headers: {"content-type": "application/json"});
                      }
                    },
                    icon: const Icon(Icons
                        .fiber_manual_record), //icon data for elevated button
                    label: const Text("Start/Stop Recording"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 7, 198, 109),
                    )),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("uuid");
                      String u =
                          "https://kit.rtirl.com/api/$uuid/pauseRecording";
                      String u1 =
                          "https://kit.rtirl.com/api/$uuid/obsRecording";
                      String u2 =
                          "https://kit.rtirl.com/api/$uuid/unpauseRecording";
                      // print(u);
                      Uri uri = Uri.parse(u);
                      Uri uri1 = Uri.parse(u1);
                      Uri uri2 = Uri.parse(u2);
                      final Response res1 = await get(uri1);
                      //  print(res1.body);
                      //final jsonData=jsonDecode(res1.body);
                      // print(jsonData);

                      if (res1.body == 'paused') {
                        Response res = await http.post(uri2,
                            body: "[]",
                            headers: {"content-type": "application/json"});
                        //   print(res.statusCode);
                      } else {
                        Response res = await http.post(uri,
                            body: "[]",
                            headers: {"content-type": "application/json"});
                      }
                    },
                    icon:
                        const Icon(Icons.pause), //icon data for elevated button
                    label: const Text("Pause/Unpause Recording"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 231, 156, 58),
                    )),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("uuid");
                      String u =
                          "https://kit.rtirl.com/api/$uuid/saveReplayBuffer";
                      //       print(u);
                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      //   print(res.statusCode);
                    },
                    icon: const Icon(
                        Icons.save_alt_rounded), //icon data for elevated button
                    label: const Text("Save replay buffer"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 88, 120, 218),
                    )),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("uuid");
                      String u =
                          "https://kit.rtirl.com/api/$uuid/startReplayBuffer";
                      // print(u);
                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      //    print(res.statusCode);
                    },
                    icon: const Icon(Icons
                        .replay_10_outlined), //icon data for elevated button
                    label: const Text("Start replay buffer"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 88, 120, 218),
                    )),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("uuid");
                      String u =
                          "https://kit.rtirl.com/api/$uuid/startVirtualcam";
                      String u1 =
                          "https://kit.rtirl.com/api/$uuid/obsVirtualcam";
                      String u2 =
                          "https://kit.rtirl.com/api/$uuid/stopVirtualcam";
                      // print(u);
                      Uri uri = Uri.parse(u);
                      Uri uri1 = Uri.parse(u1);
                      Uri uri2 = Uri.parse(u2);
                      final Response res1 = await get(uri1);
                      // print(res1.body);
                      //final jsonData=jsonDecode(res1.body);
                      // print(jsonData);

                      if (res1.body == 'stopped') {
                        Response res = await http.post(uri,
                            body: "[]",
                            headers: {"content-type": "application/json"});
                        //   print(res.statusCode);
                      } else {
                        Response res = await http.post(uri2,
                            body: "[]",
                            headers: {"content-type": "application/json"});
                      }
                    },
                    icon: const Icon(
                        Icons.camera_alt_sharp), //icon data for elevated button
                    label: const Text("Start/Stop Virtual Camera"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 233, 82, 71),
                    )),
                ElevatedButton.icon(
                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Scenesnew()),
                      );
                    },
                    icon: const Icon(Icons
                        .picture_in_picture_alt_rounded), //icon data for elevated button
                    label: const Text("Set Current Scene"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 122, 239, 126),
                    )),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("uuid");
                      String u =
                          "https://kit.rtirl.com/api/$uuid/setCurrentTransition";
                      //  print(u);
                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[\"Cut\"]",
                          headers: {"content-type": "application/json"});
                      //   print(res.statusCode);
                    },
                    icon: const Icon(
                        Icons.cut_outlined), //icon data for elevated button
                    label:
                        const Text("Set Current Transition Cut"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 219, 131, 241),
                    )),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("uuid");
                      String u =
                          "https://kit.rtirl.com/api/$uuid/setCurrentTransition";
                      //  print(u);
                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[\"Fade\"]",
                          headers: {"content-type": "application/json"});
                      //  print(res.statusCode);
                    },
                    icon: const Icon(
                        Icons.rounded_corner), //icon data for elevated button
                    label:
                        const Text("Set Current Transition Fade"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 219, 131, 241),
                    )),
                ElevatedButton.icon(
                    onPressed: () {
                      //  print("status");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Status()));
                    },
                    icon: const Icon(
                        Icons.update), //icon data for elevated button
                    label: const Text("Status"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 86, 84, 86),
                    )),
              ],
            ),
          ),
        ],
      ));

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm before Streaming'),
            content:
                const Text("Are you sure you want to start/stop streaming"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Yes'),
                onPressed: () async {
                  String r = StorageUtil.getString("uuid");
                  String u = "https://kit.rtirl.com/api/$uuid/startStarting";
                  String u1 = "https://kit.rtirl.com/api/$uuid/obsStreaming";
                  String u2 = "https://kit.rtirl.com/api/$uuid/stopStreaming";
                  // print(u);
                  Uri uri = Uri.parse(u);
                  Uri uri1 = Uri.parse(u1);
                  Uri uri2 = Uri.parse(u2);
                  final Response res1 = await get(uri1);
                  // print(res1.body);
                  //final jsonData=jsonDecode(res1.body);
                  // print(jsonData);

                  if (res1.body == 'stopped') {
                    Response res = await http.post(uri,
                        body: "[]",
                        headers: {"content-type": "application/json"});
                    //   print(res.statusCode);
                  } else {
                    Response res = await http.post(uri2,
                        body: "[]",
                        headers: {"content-type": "application/json"});
                  }
                },
              ),
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}