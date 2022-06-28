import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'alert.dart';
import 'home.dart';
class scenes extends StatefulWidget {
  //const scenes({Key? key}) : super(key: key);

  @override
  _scenesState createState() => _scenesState();
}
class _scenesState extends State<scenes>{ 



  String dropdownvalue = 'Webcam';  
 
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text( " Switch scenes"),
            DropdownButton(
               
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

            
            

          ],
        ),
      ),
    );
  }
}