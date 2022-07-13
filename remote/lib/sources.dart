


import 'package:flutter/material.dart';
import 'home.dart';
  class Sources extends StatelessWidget {
  const Sources({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) => Scaffold(
         appBar: AppBar(
         title: const Text("Sources"),
     actions: [PopupMenuButton<int>(
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
                        child: Text('Licenses'),
                      ),
                        const PopupMenuItem<int>(
                        value:5,
                        child: Text('About'),
                      ),
                ],
              ),],
      ),
        body:Column(children:[        const SizedBox(
              height: 10,
            ),Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        
      ),
      height: 50,child:Center(child: Row(//mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
               const Icon(Icons.remove_red_eye),  
               const Text( " Discord Overlay"),
               PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                     const PopupMenuItem<int>(
                        value:8,
                        child:Text('toggle visibility'),
                      ),
                    const PopupMenuItem<int>(
                        value:9,
                        child:Text('filters'),
                      ),
                        const PopupMenuItem<int>(
                        value:10,
                        child:Text('Preview'),
                      ),
                       const PopupMenuItem<int>(
                        value:3,
                        child:Text('Remove'),
                      ),
                       
                ],
              ),

          ],
        ), ),),
        const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
      Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        
      ),
      height: 50,child:Center(child: Row(//mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
              const Icon(Icons.remove_red_eye),  
              const Text( " Twitch Overlay"),
               PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       const PopupMenuItem<int>(
                        value:8,
                        child: Text('toggle visibility'),
                      ),
                    const PopupMenuItem<int>(
                        value:9,
                        child: Text('filters'),
                      ),
                       const PopupMenuItem<int>(
                        value:10,
                        child:Text('Preview'),
                      ),
                       const PopupMenuItem<int>(
                        value:3,
                        child:Text('Remove'),
                      ),
                       
                ],
              ),

          ],
        ), ),),
          const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
        Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        
      ),
      height: 50,child:Center(child: Row(//mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
              const Icon(Icons.camera_alt_sharp),  
              const Text( " Webcam"),
               PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       const PopupMenuItem<int>(
                        value:8,
                        child:Text('toggle visibility'),
                      ),
                    const PopupMenuItem<int>(
                        value:9,
                        child:Text('filters'),
                      ),
                       const PopupMenuItem<int>(
                        value:10,
                        child: Text('Preview'),
                      ),
                       const PopupMenuItem<int>(
                        value:3,
                        child:Text('Remove'),
                      ),
                       
                ],
              ),

          ],
        ), ),),
          const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
        Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        
      ),
      height: 50,child:Center(child: Row(//mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
              const Icon(Icons.remove_red_eye),  
              const Text( " Primary Monitor"),
               PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       const PopupMenuItem<int>(
                        value:8,
                        child:Text('toggle visibility'),
                      ),
                    const PopupMenuItem<int>(
                        value:9,
                        child:Text('filters'),
                      ),
                       const PopupMenuItem<int>(
                        value:10,
                        child:Text('Preview'),
                      ),
                       const PopupMenuItem<int>(
                        value:3,
                        child: Text('Remove'),
                      ),
                       
                ],
              ),

          ],
        ), ),),
          const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
        
        ])
  );
}
