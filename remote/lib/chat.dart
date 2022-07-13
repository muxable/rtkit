


import 'package:flutter/material.dart';
import 'package:remote/home.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
    => Scaffold(
         appBar: AppBar(actions: [PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       const PopupMenuItem<int>(
                        value:0,
                        child: Text('Settings'),
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
       
       title: const Text("Twitch Chat"),
      
      ),
      body: Center( 
        child:
      
           IconButton(  
            icon: const Icon(Icons.chat,
            size: 50,  
            color: Colors.brown,  
            
            ), onPressed: () {  },),


        
        ));
   }