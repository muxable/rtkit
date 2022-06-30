// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_model.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
   
    
  return Consumer(
    builder:(context,ThemeModel themeNotifier,child){
    
    return Scaffold(
      appBar: AppBar(/*
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),*/title: Center(child: Text('Settings')),
      ),
      
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
         
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                
                Text(
                  "General",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
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
            buildNotificationOptionRow("Confirm before starting stream", true),
           
            SizedBox(
              height: 40,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
               
                Text(
                  "Appearance/Colors",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),

            buildNotificationOptionRow("Enable Twitch chat emotes", true),
          
            SizedBox(
              height: 10,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                
                Text(
                  "Other",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
               
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Row( mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Icon(
      Icons.timer_outlined,
      
      size: 30.0,
    ),
       SizedBox(
              height: 10,
              width:10,
            ),
       buildNotificationOptionRow("Increase Timeout time", true),     ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Icon(
      Icons.support_rounded,size:30.0,),
         SizedBox(
              height: 10,
               width:10,
            ),
            buildNotificationOptionRow("Suppress errors ", true),]),
             Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Icon(
      Icons.picture_in_picture,size:30.0,),
         SizedBox(
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
              onChanged: (bool val) {},
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
                      child: Text("Close")),
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
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}