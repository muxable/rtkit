

import 'package:flutter/material.dart';

class Operations extends StatefulWidget {
  const Operations({Key? key}) : super(key: key);

  @override
  State<Operations> createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Operations"),
          centerTitle: true,
         
        ),
        body:Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

         
          Row(children: [
            const SizedBox(width:15),
             ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      
                      icon: const Icon(Icons.settings_input_antenna),  //icon data for elevated button
                      label: const Text("Start Streaming"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.green, minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),
              ) ),
                           const SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.settings_input_antenna),  //icon data for elevated button
                      label: const Text("Stop Streaming"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.redAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                       
                        


                         
          ],),
          Row(children: [ const SizedBox(width:15),
             ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.fiber_manual_record),  //icon data for elevated button
                      label: const Text("Start Recording"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.green,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                           const SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.stop),  //icon data for elevated button
                      label: const Text("Stop Recording"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.redAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                       
                        const SizedBox(height:10,width:10),
             
          ],),
            Row(children: [ const SizedBox(width:15),
             ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.save_alt_rounded),  //icon data for elevated button
                      label: const Text("Save replay buffer"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.lightGreen,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                           const SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.replay_10_outlined),  //icon data for elevated button
                      label: const Text("Start replay buffer"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.lightGreen,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                       
                        const SizedBox(height:10,width:10),
        ],),
        Row(children: [ const SizedBox(width:15),
          ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.pause),  //icon data for elevated button
                      label: const Text("Pause Recording"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.amberAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),

  const SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.play_arrow), //icon data for elevated button
                      label: const Text("Unpause Recording"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.orangeAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                        
        ],),
        Row(children: [ const SizedBox(width:20),
             ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.camera_alt_sharp),  //icon data for elevated button
                      label: const Text("Start Virtual Camera"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.green,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                           const SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: const Icon(Icons.visibility_off),  //icon data for elevated button
                      label: const Text("Stop Virtual Camera"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.redAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                       
                        const SizedBox(height:10,width:10),
        ],),]));
    
  
}