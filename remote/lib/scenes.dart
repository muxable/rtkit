// ignore_for_file: camel_case_types, library_private_types_in_public_api, prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';

import 'home.dart';
class scenes extends StatefulWidget {
const scenes({Key? key}) : super(key: key);

  @override
  _scenesState createState() => _scenesState();
}
class _scenesState extends State<scenes>{ 



  String dropdownvalue = 'Webcam';  
  String dropdownvalue1 = 'cut';  
 
  // List of items in our dropdown menu
  var items = [   
    'Webcam',
    'Desktop',
    'Desktop2',
    'Webcam with chat',
    'Screenshare',
  ];
  var items1=['cut','fade'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Scenes & Transitions"),
        actions: [ PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       const PopupMenuItem<int>(
                        value:0,
                        child:const Text('Settings'),
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
                        child:const Text('Licenses'),
                      ),
                        const PopupMenuItem<int>(
                        value:5,
                        child:const Text('About'),
                      ),
                ],
              ),],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
         
          children: [
          SizedBox(height:40,width:20),
            Text( " Switch scenes",  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height:40,width:20),
            DropdownButton(
               focusColor: Colors.blue[900],
               dropdownColor: Colors.lightBlueAccent,
               iconEnabledColor: Colors.blueAccent,
               iconDisabledColor: Colors.blueAccent[700],
              // Initial Value
              value: dropdownvalue,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),

            SizedBox(height:40,width:20),
             Text( " Transitions",  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
               SizedBox(height:40,width:20),
              DropdownButton(
               focusColor: Colors.black87,
               dropdownColor: Colors.lightBlueAccent,
               iconEnabledColor: Colors.blueAccent,
               iconDisabledColor: Colors.blueAccent[700],
              // Initial Value
              value: dropdownvalue1,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: items1.map((String items1) {
                return DropdownMenuItem(
                  value: items1,
                  child: Text(items1),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue1 = newValue!;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}