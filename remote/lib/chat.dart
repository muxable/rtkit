
// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:remote/home.dart';

class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
    => Scaffold(
         appBar: AppBar(actions: [PopupMenuButton<int>(
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
       
       title: Text("Twitch chat"),
      
      ),
      body: Center( 
        child:
      
           IconButton(  
            icon: Icon(Icons.chat,
            size: 50,  
            color: Colors.brown,  
            
            ), onPressed: () {  },),


        
        ));
   }