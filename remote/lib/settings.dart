

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
 State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
   
    
  return Consumer(
    builder:(context,ThemeModel themeNotifier,child){
    
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Settings')),
      ),
      
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
         
            Row(
           
              children: const [
                
               Text(
                  "General",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
           
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Change theme',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
           child:IconButton(onPressed:  (){ 
          themeNotifier.isDark
          ? themeNotifier.isDark=false:themeNotifier.isDark=true;
        }, icon: Icon(themeNotifier.isDark?Icons.wb_sunny:Icons.nightlight_round)))
      ],
    ),

            //buildAccountOptionRow(context, "Change theme"),
            buildNotificationOptionRow("Wake lock", true),
            buildNotificationOptionRow("Confirm before streaming", true),
           
            const SizedBox(
              height: 40,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
               
                const Text(
                  "Appearance/Colors",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),

            buildNotificationOptionRow("Enable Twitch chat emotes", true),
          
            const SizedBox(
              height: 10,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                
                const Text(
                  "Other",
                  style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
               
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Row( mainAxisAlignment: MainAxisAlignment.start,
              children: [
               const Icon(
      Icons.timer_outlined,
      
      size: 30.0,
    ),
       const SizedBox(
              height: 10,
              width:10,
            ),
       buildNotificationOptionRow("Increase Timeout time", true),     ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               const Icon(
      Icons.support_rounded,size:30.0,),
         const SizedBox(
              height: 10,
               width:10,
            ),
            buildNotificationOptionRow("Suppress errors ", true),]),
             Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
               const Icon(
      Icons.picture_in_picture,size:30.0,),
         const SizedBox(
              height: 10,
               width:10,
            ),
           buildNotificationOptionRow("OBS:Use PNG preview", true),]),

        
          ],
        ),
      )
    );});}
  

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {

              },
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                 
                  /* children:[
                    Container(child: CheckBoxExample(),
                    )]*/
                   
                 
                ),
                actions: [
                  
                
                  

                TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}