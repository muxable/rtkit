

import 'package:flutter/material.dart';
import 'settings.dart';
import 'qr_code.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  TextEditingController textFieldController = TextEditingController();
 
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("OBS Studio"),
          centerTitle: true,
          actions: [
              
             Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white),
                textTheme: const TextTheme().apply(bodyColor: Colors.white),
              ),
               child: PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       const PopupMenuItem<int>(
                        value:0,
                        child:Text('Settings'),
                      ),
                    const PopupMenuItem<int>(
                        value:1,
                        child:Text('Remove Ads'),
                      ),
                       const PopupMenuItem<int>(
                        value:2,
                        child:Text('Feature Requests'),
                      ),
                       const PopupMenuItem<int>(
                        value:3,
                        child:Text('Error Log'),
                      ),
                        const PopupMenuItem<int>(
                        value:4,
                        child:Text('Licenses'),
                      ),
                        const PopupMenuItem<int>(
                        value:5,
                        child: Text('About'),
                      ),
                ],
              ),

            ),
          ],
        ),
        body:Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

         
           
            const SizedBox(height: 10),
           FloatingActionButton.extended(icon:const Icon(Icons.camera_alt),
           label:const Text("Scan"),
           onPressed:() { 
           
                     Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Qrcode()));
           
           },),
            const SizedBox(height: 10),
         /* ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Operations()));
                      }, 
                      icon: const Icon(Icons.work),  //icon data for elevated button
                      label: const Text("Operations"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.amberAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),*/
            const SizedBox(height: 10),
       //Image.asset('images/qr_code.png',height:150,width:150),
      //const SizedBox(height: 10),
          const Text('Make sure its configured like this:'),

        Image.asset('images/obs_ins.png',height:100,width:200),/*
          Row(children: [
            SizedBox(width:15),
             ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      
                      icon: Icon(Icons.settings_input_antenna),  //icon data for elevated button
                      label: Text("Start Streaming"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.green, minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),
              ) ),
                           SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: Icon(Icons.settings_input_antenna),  //icon data for elevated button
                      label: Text("Stop Streaming"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.redAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                       
                        


                         
          ],),
          Row(children: [ SizedBox(width:15),
             ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: Icon(Icons.fiber_manual_record),  //icon data for elevated button
                      label: Text("Start Recording"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.green,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                           SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: Icon(Icons.stop),  //icon data for elevated button
                      label: Text("Stop Recording"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.redAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                       
                        SizedBox(height:10,width:10),
             
          ],),
            Row(children: [ SizedBox(width:15),
             ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: Icon(Icons.save_alt_rounded),  //icon data for elevated button
                      label: Text("Save replay buffer"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.lightGreen,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                           SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: Icon(Icons.replay_10_outlined),  //icon data for elevated button
                      label: Text("Start replay buffer"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.lightGreen,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                       
                        SizedBox(height:10,width:10),
        ],),
        Row(children: [ SizedBox(width:15),
          ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: Icon(Icons.pause),  //icon data for elevated button
                      label: Text("Pause Recording"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.amberAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),

  SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: Icon(Icons.play_arrow), //icon data for elevated button
                      label: Text("Unpause Recording"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.orangeAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                        
        ],),
        Row(children: [ SizedBox(width:20),
             ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: Icon(Icons.camera_alt_sharp),  //icon data for elevated button
                      label: Text("Start Virtual Camera"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.green,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                           SizedBox(height:10,width:10),
            ElevatedButton.icon(
                      onPressed: (){
                        
                      }, 
                      icon: Icon(Icons.visibility_off),  //icon data for elevated button
                      label: Text("Stop Virtual Camera"), //label text 
                      style: ElevatedButton.styleFrom(
                         primary: Colors.redAccent,minimumSize: const Size(175, 40),
    maximumSize: const Size(175, 40),)),
                       
                        SizedBox(height:10,width:10),
        ],)*/],
        /*children: [ 
            Text(  "Add a browser source in OBS: https://kit.rtirl.com/b210343d-60da-418c-a824-1def9907afcd"
            ),
        Image.asset('assets/images/qr_code.png',height:200,width:200),
        Text(  
          "Make sure it's configured like this:"
        ),
        Image.asset('assets/images/obs_ins.png',height:100,width:200),
        
          ],
        ),*/
  ),
  );
}
void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
        break;
      case 1:
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
        break;
      case 2:
       // print('Feature Requests clicked');
        break;
      case 3:
      //  print('Error Log clicked');
        break;
      case 4:
      //  print('Licenses clicked');
        break;
      case 5:
        //print('About');
        break;
      case 6:
        _showDialog1(context);
        break;
      case 7:
        
        break;
        
               
  
    }
    
  }
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
  