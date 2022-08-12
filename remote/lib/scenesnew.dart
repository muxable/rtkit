
// ignore_for_file: unused_local_variable

// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:remote/size.dart';
import 'package:remote/storage_util.dart';
import 'package:remote/variables.dart';


class Scenesnew extends StatefulWidget {
  const Scenesnew({Key? key}) : super(key: key);

  @override
  State<Scenesnew> createState() => _ScenesnewState();
}

class _ScenesnewState extends State<Scenesnew> {
  var _postsJson=[];
  
   static String r = StorageUtil.getString("url");

  static var x = r.split('/');

                      static String u = "${x[0]}//${x[2]}/api/${x[3]}/obsScenes";
                
                      Uri uri = Uri.parse(u);
  void fetchPosts() async{ 
    try{
     // print("hi");
      final response=await get (uri);
     // print(response.body);
     // print(response.statusCode);
      final jsonData=jsonDecode(response.body) as List;
      setState(() {
        _postsJson=jsonData;
      });
    }
    catch(err){
throw Exception ("invalid");
    
    }
  
  }
    @override initState(){ 
      
      super.initState();
      fetchPosts();
    }
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Scenes"),
        centerTitle: true,
      ),
      body:Column(children: [SizedBox(
        
          height:displayHeight(context)-
                 MediaQuery.of(context).padding.top -
                 kToolbarHeight,width:displayWidth(context),
        
        child:ListView.builder(
        itemCount:_postsJson.length,
      
        
        itemBuilder: (context,i){

         String post=_postsJson[i].toString();

         return ElevatedButton.icon(
                    onPressed: () async { 
  String r=StorageUtil.getString("uuid");
                        String u="https://kit.rtirl.com/api/$uuid/setCurrentScene";
                 //       print(u);
                          Uri uri = Uri.parse(u);






                     // String r = StorageUtil.getString("url");

 //var x = r.split('/');

                       //String u = "${x[0]}//${x[2]}/api/${x[3]}/setCurrentScene";
                
                     // Uri uri = Uri.parse(u);
                        Response res = await http.post(uri,
                          body: "[\"$post\"]",
                          headers: {"content-type": "application/json"});
                   //   print(res.statusCode);
                     },
                    icon: const Icon(
                        Icons.picture_in_picture_rounded), 
                      //icon data for elevated button
                    label: Text( " $post"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                     
                    ), );
        }
    
      ))]),);
}