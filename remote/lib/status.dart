import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remote/home.dart';
import 'package:remote/operations.dart';
import 'package:remote/size.dart';
import 'package:remote/variables.dart';

Future<Result> fetchPost() async {
  String u = "https://kit.rtirl.com/api/$uuid";

  Uri uri = Uri.parse(u);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Result.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load status');
  }
}

class Result {
  final String? obsTransition;
  final String? obsStreaming;
  final List<String> obsScenes;
  final Obss obsScene;
  final String? obsVirtualcam;
  final int? obsControlLevel;
  final String? obsRecording;
  final String? activeAgentId;
  final List<String> obsTransitions;
  final String? obsReplaybuffer;
  Result(
      {required this.obsTransition,
      required this.obsStreaming,
      required this.obsScenes,
      required this.obsScene,
      required this.obsVirtualcam,
      required this.obsControlLevel,
      required this.obsRecording,
      required this.activeAgentId,
      required this.obsTransitions,
      required this.obsReplaybuffer});

  factory Result.fromJson(Map<String, dynamic> json) {
    var obsScenesFromJson = json["obsScenes"];
    List<String> obsS = obsScenesFromJson.cast<String>();
    var obsTransitionsFromJson = json["obsTransitions"];
    List<String> obsT = obsTransitionsFromJson.cast<String>();

    return Result(
      obsTransition: json['obsTransition'],
      obsStreaming: json['obsStreaming'],
      obsScenes: obsS,
      obsScene: Obss.fromJson(json['obsScene']),
      obsVirtualcam: json['obsVirtualcam'],
      obsControlLevel: json['obsControlLevel'],
      obsRecording: json['obsRecording'],
      activeAgentId: json['activeAgentId'],
      obsTransitions: obsT,
      obsReplaybuffer: json['obsReplaybuffer'],
    );
  }
}

class Obss {
  int width;
  String name;
  int height;

  Obss({
    required this.width,
    required this.name,
    required this.height,
  });

  factory Obss.fromJson(Map<String, dynamic> json) {
    return Obss(
      width: json['width'],
      name: json['name'],
      height: json['height'],
    );
  }
}

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  late Future<Result> futureResult;

  @override
  void initState() {
    super.initState();
    futureResult = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Status Page',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text("Current Status"),
        ),
        body: Center(
          child: FutureBuilder<Result>(
              future: futureResult,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                      height: displayHeight(context) * 0.8,
                      width: displayWidth(context) * 0.9,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                '->activeAgentId: ${snapshot.data!.activeAgentId} \n\n->obsControlLevel: ${snapshot.data!.obsControlLevel}\n\n->obsStreaming: ${snapshot.data!.obsStreaming} \n\n->obsScenes:\n${snapshot.data!.obsScenes} \n\n->obsScene:\n height:${snapshot.data!.obsScene.height}\n name:${snapshot.data!.obsScene.name}\n width:${snapshot.data!.obsScene.width} \n\n->obsVirtualcam: ${snapshot.data!.obsVirtualcam} \n\n->obsControlLevel: ${snapshot.data!.obsControlLevel} \n\n->obsRecording: ${snapshot.data!.obsRecording} \n\n->obsTransitions: ${snapshot.data!.obsTransitions} \n\n->obsReplaybuffer: ${snapshot.data!.obsReplaybuffer}',
                                style: TextStyle(
                                    fontSize: displayHeight(context) * 0.02,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 29, 14, 14))),
                          ]));
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}

Widget postTemplate(post) {
  return Card(
    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    elevation: 4.0,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              post.content,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
          ]),
    ),
  );
}
