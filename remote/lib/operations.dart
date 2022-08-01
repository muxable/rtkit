// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:remote/main.dart';
import 'package:remote/scenesnew.dart';
import 'package:remote/settings.dart';
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
          centerTitle: true,),
      body:
  CustomScrollView(
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
                    label: const Text("Start Streaming"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 237, 217, 42),
                      //minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),
          ElevatedButton.icon(
           
                    onPressed: () async {
                      if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/stopStreaming";
                        Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                         // print(res.statusCode);
                      }
                      else{ 
                        String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/stopStreaming";
                       // print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                         // print(res.statusCode);
                      }

                    
                     // print(res.statusCode);
                    },
                    icon: const Icon(Icons
                        .settings_input_antenna), //icon data for elevated button
                    label: const Text("Stop Streaming"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 233, 82, 71),
                     // minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),
            ElevatedButton.icon(
                  onPressed: () async {
                    if(uuid==null){
                    String r = StorageUtil.getString("url");

                    // print("string is $r");
                    var x = r.split('/');
                    //print(x);
                    String u = "${x[0]}//${x[2]}/api/${x[3]}/startRecording";
                  // print(u);
                    //String u=r+"/startStreaming";
                    Uri uri = Uri.parse(u);
                    //print(uri);
                    Response res = await http.post(uri,
                        body: "[]",
                        headers: {"content-type": "application/json"});
                   // print(res.statusCode);
                  }
                   else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/startRecording";
                       // print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                       //   print(res.statusCode);
                    }},
                  icon: const Icon(Icons
                      .fiber_manual_record), //icon data for elevated button
                  label: const Text("Start Recording"), //label text
                    style: ElevatedButton.styleFrom(
                         primary: const Color.fromARGB(255, 237, 217, 42)//,minimumSize: const Size(175, 40),
   // maximumSize: const Size(175, 40)
   ,)
                ),

                  ElevatedButton.icon(
                       onPressed: () async {
                        if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/stopRecording";
                     // print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                     // print(res.statusCode);
                    }
                     else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/stopRecording";
                        //print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                       //   print(res.statusCode);
                    }},
                    icon:
                        const Icon(Icons.stop), //icon data for elevated button
                    label: const Text("Stop Recording"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 233, 82, 71),
                     // minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),
                      ElevatedButton.icon(
                     onPressed: () async {
                      if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/pauseRecording";
                     // print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                   //   print(res.statusCode);
                    }
                     else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/pauseRecording";
                     //   print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                     //     print(res.statusCode);
                    }},
                    icon:
                        const Icon(Icons.pause), //icon data for elevated button
                    label: const Text("Pause Recording"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 231, 188, 32),
                    //  minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),
                      ElevatedButton.icon(
                     onPressed: () async {
                      if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/unpauseRecording";
                   //   print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                  //    print(res.statusCode);
                    }
                     else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/unpauseRecording";
                    //    print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                        //  print(res.statusCode);
                    }},
                    icon: const Icon(
                        Icons.play_arrow), //icon data for elevated button
                    label: const Text("Unpause Recording"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 231, 156, 58),
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),



                    
           ElevatedButton.icon(
                       onPressed: () async {
                        if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/saveReplayBuffer";
                    //  print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                    //  print(res.statusCode);
                    }
                     else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/saveReplayBuffer";
                 //       print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                       //   print(res.statusCode);
                    }},
                    icon: const Icon(
                        Icons.save_alt_rounded), //icon data for elevated button
                    label: const Text("Save replay buffer"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 237, 217, 42),
                      //minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),
      ElevatedButton.icon(
                       onPressed: () async {
                        if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/startReplayBuffer";
                     // print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                    //  print(res.statusCode);
                    }
                     else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/startReplayBuffer";
                       // print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      //    print(res.statusCode);
                    }},
                    icon: const Icon(Icons
                        .replay_10_outlined), //icon data for elevated button
                    label: const Text("Start replay buffer"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 233, 82, 71),
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),

                

                     ElevatedButton.icon(
                   onPressed: () async {
                    if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/startVirtualcam";
                    //  print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                    //  print(res.statusCode);
                    }
                     else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/startVirtualcam";
                      //  print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                        //  print(res.statusCode);
                    }},
                    icon: const Icon(
                        Icons.camera_alt_sharp), //icon data for elevated button
                    label: const Text("Start Virtual Camera"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 237, 217, 42),
                      //minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),

                      ElevatedButton.icon(
                    onPressed: () async {
                      if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/stopVirtualcam";
                    //  print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                    //  print(res.statusCode);
                    }
                     else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/stopVirtualcam";
                     //   print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                       //   print(res.statusCode);
                    }},
                    
                    icon: const Icon(
                        Icons.visibility_off), //icon data for elevated button
                    label: const Text("Stop Virtual Camera"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 233, 82, 71),

                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),

                        ElevatedButton.icon(
                   onPressed: () async {
                     
                    Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Scenesnew()),
        );
                    },
                    icon: const Icon(
                        Icons.picture_in_picture_alt_rounded), //icon data for elevated button
                    label: const Text("Set Current Scene"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 122, 239, 126),
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),
                       ElevatedButton.icon(
                    onPressed: () async {
                      if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/setCurrentTransition";
                   //   print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[\"Cut\"]",
                          headers: {"content-type": "application/json"});
                   //   print(res.statusCode);
                    }
                     else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/setCurrentTransition";
                      //  print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[\"Cut\"]",
                          headers: {"content-type": "application/json"});
                       //   print(res.statusCode);
                    }},
                       
          
                    icon: const Icon(
                        Icons.cut_outlined), //icon data for elevated button
                    label: const Text("Set Current Transition Cut"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 219, 131, 241),
                      //minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),
       


        ElevatedButton.icon(
                    onPressed: () async {
                      if(uuid==null){
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/setCurrentTransition";
                     // print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[\"Fade\"]",
                          headers: {"content-type": "application/json"});
                 //     print(res.statusCode);
                    }
                    else{
                      String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/setCurrentTransition";
                      //  print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[\"Fade\"]",
                          headers: {"content-type": "application/json"});
                        //  print(res.statusCode);
                    }},
                    icon: const Icon(
                        Icons.rounded_corner),//icon data for elevated button
                    label: const Text("Set Current Transition Fade"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 219, 131, 241),
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),



                       ElevatedButton.icon(
                    onPressed: () async {
                   Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  const MainPage()));
                    },
                    icon: const Icon(
                        Icons.home_filled),//icon data for elevated button
                    label: const Text("Home"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 86, 84, 86),
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),



                           ElevatedButton.icon(
                    onPressed: () async {
                   Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  const SettingsPage()));
                    },
                    icon: const Icon(
                        Icons.settings),//icon data for elevated button
                    label: const Text("Settings"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 86, 84, 86),
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),


                         ElevatedButton.icon(
                    onPressed: () {},
               
                    icon: const Icon(
                        Icons.update),//icon data for elevated button
                    label: const Text("Status"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 86, 84, 86),
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),


        ],
      ),
    ),
  ],
)
  
);


_displayDialog(BuildContext context) async {
 return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm before Streaming'),
            content: const Text("Are you sure you want to start streaming"),
           
            actions: <Widget>[
              ElevatedButton(
                child:  const Text('Yes'),
                onPressed: () async {
                  if(uuid==null){
                    String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/startStreaming";
                      

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});}
                          else
                          {
                            String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/startStreaming";
                     //   print(u);
                          Uri uri = Uri.parse(u);

                      
                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                   //       print(res.statusCode);
                          }
                      //print(res.statusCode);*/
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
        });}

/*
 void _showDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Remove host"),
          content: const Text("Are you sure you want to remove this connection?"),
          actions: [
               TextButton(
              onPressed: () => Navigator.pop(context, 'NO'),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'YES'),
              child: const Text('YES'),
            ),
          ],
        );
      },
    );
  }

}  */
      /*
       Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: [
            Row(  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const SizedBox(width: 15),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/startStreaming";
                      

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      //print(res.statusCode);
                    },
                    icon: const Icon(Icons
                        .settings_input_antenna), //icon data for elevated button
                    label: const Text("Start Streaming"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      //minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),
                       const VerticalDivider(),
              //  const SizedBox(height: 10, width: 10),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/stopStreaming";
                      

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                     // print(res.statusCode);
                    },
                    icon: const Icon(Icons
                        .settings_input_antenna), //icon data for elevated button
                    label: const Text("Stop Streaming"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                     // minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: () async {
                    String r = StorageUtil.getString("url");

                    // print("string is $r");
                    var x = r.split('/');
                    //print(x);
                    String u = "${x[0]}//${x[2]}/api/${x[3]}/startRecording";
                    print(u);
                    //String u=r+"/startStreaming";
                    Uri uri = Uri.parse(u);
                    //print(uri);
                    Response res = await http.post(uri,
                        body: "[]",
                        headers: {"content-type": "application/json"});
                    print(res.statusCode);
                  },
                  icon: const Icon(Icons
                      .fiber_manual_record), //icon data for elevated button
                  label: const Text("Start Recording"), //label text
                    style: ElevatedButton.styleFrom(
                         primary: Colors.green//,minimumSize: const Size(175, 40),
   // maximumSize: const Size(175, 40)
   ,)
                ),
              const VerticalDivider(),
                ElevatedButton.icon(
                       onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/stopRecording";
                      print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      print(res.statusCode);
                    },
                    icon:
                        const Icon(Icons.stop), //icon data for elevated button
                    label: const Text("Stop Recording"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                     // minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),
                //const SizedBox(height: 10, width: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const SizedBox(width: 15),
                ElevatedButton.icon(
                       onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/saveReplayBuffer";
                      print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      print(res.statusCode);
                    },
                    icon: const Icon(
                        Icons.save_alt_rounded), //icon data for elevated button
                    label: const Text("Save replay buffer"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                      //minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),
                //const SizedBox(height: 10, width: 10),
                const VerticalDivider(),
                ElevatedButton.icon(
                       onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/startReplayBuffer";
                      print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      print(res.statusCode);
                    },
                    icon: const Icon(Icons
                        .replay_10_outlined), //icon data for elevated button
                    label: const Text("Start replay buffer"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen,
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),
                //const SizedBox(height: 10, width: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               // const SizedBox(width: 15),
                ElevatedButton.icon(
                     onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/pauseRecording";
                      print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      print(res.statusCode);
                    },
                    icon:
                        const Icon(Icons.pause), //icon data for elevated button
                    label: const Text("Pause Recording"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amberAccent,
                    //  minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),
               // const SizedBox(height: 10, width: 10),
               const VerticalDivider(),
                ElevatedButton.icon(
                     onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/unpauseRecording";
                      print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      print(res.statusCode);
                    },
                    icon: const Icon(
                        Icons.play_arrow), //icon data for elevated button
                    label: const Text("Unpause Recording"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent,
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const SizedBox(width: 20),

                ElevatedButton.icon(
                   onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/startVirtualcam";
                      print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      print(res.statusCode);
                    },
                    icon: const Icon(
                        Icons.camera_alt_sharp), //icon data for elevated button
                    label: const Text("Start Virtual Camera"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      //minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),
                //const SizedBox(height: 10, width: 10),
                const VerticalDivider(),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/stopVirtualcam";
                      print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[]",
                          headers: {"content-type": "application/json"});
                      print(res.statusCode);
                    },
                    icon: const Icon(
                        Icons.visibility_off), //icon data for elevated button
                    label: const Text("Stop Virtual Camera"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),
               // const SizedBox(height: 10, width: 10),
              ],
            ),




               Row(mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                //const SizedBox(width: 20),
                Center(
                  child:
                ElevatedButton.icon(
                   onPressed: () async {
                     
                    Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Scenesnew()),
        );
                    },
                    icon: const Icon(
                        Icons.picture_in_picture_alt_rounded), //icon data for elevated button
                    label: const Text("Set Current Scene"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),)]),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                //const SizedBox(height: 10, width: 10),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/setCurrentTransition";
                      print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[\"Cut\"]",
                          headers: {"content-type": "application/json"});
                      print(res.statusCode);
                    },
                    icon: const Icon(
                        Icons.visibility_off), //icon data for elevated button
                    label: const Text("Set Current Transition Cut"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      //minimumSize: const Size(175, 40),
                      //maximumSize: const Size(175, 40),
                    )),
                //
                //const SizedBox(height: 10, width: 10),
                const VerticalDivider(),
                ElevatedButton.icon(
                    onPressed: () async {
                      String r = StorageUtil.getString("url");

                      var x = r.split('/');

                      String u = "${x[0]}//${x[2]}/api/${x[3]}/setCurrentTransition";
                      print(u);

                      Uri uri = Uri.parse(u);

                      Response res = await http.post(uri,
                          body: "[\"Fade\"]",
                          headers: {"content-type": "application/json"});
                      print(res.statusCode);
                    },
                    icon: const Icon(
                        Icons.visibility_off), //icon data for elevated button
                    label: const Text("Set Current Transition Fade"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),
              ],
            ),



          ]));
}
*/

                      
}
    
   