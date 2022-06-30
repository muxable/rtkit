
// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'home.dart';
  class sources extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Scaffold(
         appBar: AppBar(
         title: Text("Sources"),
     
      ),
        body:Column(children:[        SizedBox(
              height: 10,
            ),Container(child:Center(child: Row(//mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
              Icon(Icons.remove_red_eye),  
              Text( " Discord Overlay"),
               PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       PopupMenuItem<int>(
                        value:8,
                        child:Text('toggle visibility'),
                      ),
                    PopupMenuItem<int>(
                        value:9,
                        child:Text('filters'),
                      ),
                       PopupMenuItem<int>(
                        value:10,
                        child:Text('Preview'),
                      ),
                       PopupMenuItem<int>(
                        value:3,
                        child:Text('Remove'),
                      ),
                       
                ],
              ),

          ],
        ), ),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        
      ),
      height: 50,),
        Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
      Container(child:Center(child: Row(//mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
              Icon(Icons.remove_red_eye),  
              Text( " Twitch Overlay"),
               PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       PopupMenuItem<int>(
                        value:8,
                        child:Text('toggle visibility'),
                      ),
                    PopupMenuItem<int>(
                        value:9,
                        child:Text('filters'),
                      ),
                       PopupMenuItem<int>(
                        value:10,
                        child:Text('Preview'),
                      ),
                       PopupMenuItem<int>(
                        value:3,
                        child:Text('Remove'),
                      ),
                       
                ],
              ),

          ],
        ), ),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        
      ),
      height: 50,),
          Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
        Container(child:Center(child: Row(//mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
              Icon(Icons.camera_alt_sharp),  
              Text( " Webcam"),
               PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       PopupMenuItem<int>(
                        value:8,
                        child:Text('toggle visibility'),
                      ),
                    PopupMenuItem<int>(
                        value:9,
                        child:Text('filters'),
                      ),
                       PopupMenuItem<int>(
                        value:10,
                        child:Text('Preview'),
                      ),
                       PopupMenuItem<int>(
                        value:3,
                        child:Text('Remove'),
                      ),
                       
                ],
              ),

          ],
        ), ),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        
      ),
      height: 50,),
          Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
        Container(child:Center(child: Row(//mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
              Icon(Icons.remove_red_eye),  
              Text( " Primary Monitor"),
               PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       PopupMenuItem<int>(
                        value:8,
                        child:Text('toggle visibility'),
                      ),
                    PopupMenuItem<int>(
                        value:9,
                        child:Text('filters'),
                      ),
                       PopupMenuItem<int>(
                        value:10,
                        child:Text('Preview'),
                      ),
                       PopupMenuItem<int>(
                        value:3,
                        child:Text('Remove'),
                      ),
                       
                ],
              ),

          ],
        ), ),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        
      ),
      height: 50,),
          Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
        
        ])
  );
}
