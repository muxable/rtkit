
// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
    => Scaffold(
         appBar: AppBar(
       
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