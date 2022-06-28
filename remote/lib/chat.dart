import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'alert.dart';
import 'home.dart';
class chat extends StatelessWidget {
  const chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
    => Scaffold(
         appBar: AppBar(
       
       title: const Text("Twitch chat"),
      
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