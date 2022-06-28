import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'alert.dart';
import 'home.dart';
  class sources extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Scaffold(
         appBar: AppBar(
         title: const Text("Sources"),
     
      ),
        body:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
              Icon(Icons.remove_red_eye),  
              Text( " Video capture Device"),
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
        )
  );
}
