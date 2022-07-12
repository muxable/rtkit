
// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import 'settings.dart';

import 'qr_code.dart';



class class1 extends StatefulWidget {
  @override
  State<class1> createState() => _class1State();
}

class _class1State extends State<class1> {
  
/*
String result = "Hey there !";
Future _scanQR() async {
  
    try {
      ScanResult qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult as String;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }*/
 
  TextEditingController textFieldController = TextEditingController();
 
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("OBS Studio"),
          centerTitle: true,
          actions: [
              
             Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white),
                textTheme: TextTheme().apply(bodyColor: Colors.white),
              ),
               child: PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       PopupMenuItem<int>(
                        value:0,
                        child:Text('Settings'),
                      ),
                    PopupMenuItem<int>(
                        value:1,
                        child:Text('Remove Ads'),
                      ),
                       PopupMenuItem<int>(
                        value:2,
                        child:Text('Feature Requests'),
                      ),
                       PopupMenuItem<int>(
                        value:3,
                        child:Text('Error Log'),
                      ),
                        PopupMenuItem<int>(
                        value:4,
                        child:Text('Licenses'),
                      ),
                        PopupMenuItem<int>(
                        value:5,
                        child:Text('About'),
                      ),
                ],
              ),

            ),
          ],
        ),
        body:Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text(  "Add a browser source in OBS: https://kit.rtirl.com/b210343d-60da-418c-a824-1def9907afcd"

            ),
           
            SizedBox(height: 10),
           FloatingActionButton.extended(icon:Icon(Icons.camera_alt),
           label:Text("Scan"),
           onPressed:() { 
           
                     Navigator.push(context,
          MaterialPageRoute(builder: (context) => qr_code()));
           
           },),
           

       Image.asset('images/qr_code.png',height:150,width:150),
      
     
        Image.asset('images/obs_ins.png',height:100,width:200),
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
        ],)],
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
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      case 1:
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      case 2:
        print('Feature Requests clicked');
        break;
      case 3:
        print('Error Log clicked');
        break;
      case 4:
        print('Licenses clicked');
        break;
      case 5:
        print('About');
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
          title: Text("Remove host"),
          content: Text("Are you sure you want to remove this connection?"),
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
  

