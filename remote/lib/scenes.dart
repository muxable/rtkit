

import 'package:flutter/material.dart';

import 'package:remote/home.dart';
class Scenes extends StatefulWidget {
const Scenes({Key? key}) : super(key: key);

  @override
  State<Scenes> createState() => _ScenesState();
}
class _ScenesState extends State<Scenes>{ 



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
                        child:Text('About'),
                      ),
                ],
              ),],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
         
          children: [
          const SizedBox(height:40,width:20),
            const Text( " Switch scenes",  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height:40,width:20),
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

            const SizedBox(height:40,width:20),
             const Text( " Transitions",  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
               const SizedBox(height:40,width:20),
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