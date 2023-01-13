import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:remote/size.dart';
import 'package:remote/variables.dart';

class Scenesnew extends StatefulWidget {
  const Scenesnew({Key? key}) : super(key: key);

  @override
  State<Scenesnew> createState() => _ScenesnewState();
}

class _ScenesnewState extends State<Scenesnew> {
  var _postsJson = [];

  Uri uri = Uri.parse("https://kit.rtirl.com/api/$uuid/obsScenes");
  void fetchPosts() async {
    try {
      final response = await get(uri);
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {
      throw Exception("invalid");
    }
  }

  @override
  initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text("Scenes"),
        ),
        body: Column(children: [
          SizedBox(
              height: displayHeight(context) -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,
              width: displayWidth(context),
              child: ListView.builder(
                  itemCount: _postsJson.length,
                  itemBuilder: (context, i) {
                    String post = _postsJson[i].toString();

                    return ElevatedButton.icon(
                      onPressed: () async {
                        String u =
                            "https://kit.rtirl.com/api/$uuid/setCurrentScene";
                        Uri uri = Uri.parse(u);
                        Response res = await http.post(uri,
                            body: "[\"$post\"]",
                            headers: {"content-type": "application/json"});
                        if (kDebugMode) {
                          print(res.statusCode);
                        }
                      },
                      icon: const Icon(Icons.picture_in_picture_rounded),
                      label: Text(" $post"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }))
        ]),
      );
}
