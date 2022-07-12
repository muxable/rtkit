// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, deprecated_member_use, unnecessary_new, prefer_const_constructors, unnecessary_const, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:remote/scenes.dart';
import 'home.dart';
import 'sources.dart';
import 'chat.dart';
import 'package:provider/provider.dart';
import 'theme_model.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
  
     return ChangeNotifierProvider(create:(_)=>ThemeModel(),
    child:Consumer( 
      builder: (context,ThemeModel themeNotifier,child){ 
        return MaterialApp(
          theme:themeNotifier.isDark?ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        title:'Real Time Kit',
        //title: Center(child: const Text('Real Time Kit'));
       
        home: MainPage(),
       
        );},));
  }
}

class MainPage extends StatelessWidget {
TextEditingController _textFieldController = TextEditingController();
   _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('OBS Studio Connection'),
            content: TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(hintText: "If your obs-websocket differs from default(4444),enter it below.Please ensure any firewalls are disabled"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
               new FlatButton(
                child: new Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });}
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Real Time kit'),
          centerTitle: true,
          actions: [
              
             Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white),
                textTheme: const TextTheme().apply(bodyColor: Colors.white),
              ),
               child: PopupMenuButton<int>(
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
              ),

            ),
          ],
        ),
          body: ColoredBox(color:Colors.grey.shade50,
         child:Column(    children: <Widget>[   Row(  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
            children: <Widget>[  
              Container(alignment: Alignment.topRight,height:100,width:100,
              child:Center(
              child: Image.asset('images/obs.png',height:80,width:80), ), ),

             
              const Flexible(fit: FlexFit.tight, child: const SizedBox()),
              Container(alignment: Alignment.topCenter,height: 100,width:100,
                child:const Center(child: Text
                (  
                  'OBS studio',  
                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              ), ),), 
              const Flexible(fit: FlexFit.tight, child: const SizedBox()),
              Container(alignment: Alignment.topRight,height: 100,width:100,
                child:Center(
           child: PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       const PopupMenuItem<int>(
                        value:6,
                        child:Text('Remove'),
                        
                      ),
                    const PopupMenuItem<int>(
                        value:7,
                        child:const Text('Edit'),
                      ),
                      
                ],
              ),
              ))
            ],  
          ), 
        
              // on selected we show the dialog box
           const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 30,
            ),
          
          Row(  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
            children: <Widget>[  
              Container(alignment: Alignment.topRight,height:100,width:100,
              child:Center(
              child: Image.asset('images/streamlabs_obs.png',height:80,width:80), ), ),

             
              const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topCenter,height: 100,width:100,
                child:const Center(child: Text
                (  
                  'Streamlabs',  
                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) 
              ), ),), 
             const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topRight,height: 100,width:100,
                child:Center(
           child: PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       const PopupMenuItem<int>(
                        value:10,
                        child:const Text('Remove'),
                        
                      ),
                    const PopupMenuItem<int>(
                        value:11,
                        child:Text('Edit'),
                      ),
                      
                      
                ],
              ),
              ))
            
            ],  
          ), 
             const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 30,
            ),
             ]  ), ),
        

    floatingActionButton: SpeedDial( animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 28.0),
      backgroundColor: Colors.orange[900],
      visible: true,
      curve: Curves.bounceInOut,
      children: [
       SpeedDialChild(
            
          child: IconButton(iconSize:100.0,
          icon:Image.asset('images/obs.png'),
           tooltip: 'obs',
         
                onPressed: () => _displayDialog(context),

          
        ),),
       SpeedDialChild(
          child: IconButton(iconSize:100.0,
          icon:Image.asset('images/streamlabs_obs.png'),
           tooltip: 'stream_labs',
          onPressed: (){ 
            
          }

          
        )),
        SpeedDialChild(
           
           child: IconButton(iconSize:100.0,
          icon:Image.asset('images/manual.png'),
           tooltip: 'manual',
           
          onPressed: () {}/*{}
                 Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyCustomForm()));
          }*/
        ),)
      ],

    ),
      bottomNavigationBar: 
      BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(iconSize: 30.0,
                padding: const EdgeInsets.only(left: 28.0),icon: const Icon(Icons.home), onPressed: () { 
                   Navigator.push(context,
          MaterialPageRoute(builder: (context) => class1()));
                },),
              
         IconButton(iconSize: 30.0,
                padding: const EdgeInsets.only(left: 28.0),icon: const Icon(Icons.volume_down), onPressed: () {


                },),
                IconButton(iconSize: 30.0,
                padding: const EdgeInsets.only(left: 28.0),icon: const Icon(Icons.featured_video), onPressed: () {  
                    Navigator.push(context,
          MaterialPageRoute(builder: (context) => scenes()));
                },),
                IconButton(iconSize: 30.0,
                padding: const EdgeInsets.only(left: 28.0),icon: const Icon(Icons.remove_red_eye),onPressed: () { 

                  Navigator.push(context,
          MaterialPageRoute(builder: (context) => sources()));
                },),
                IconButton(iconSize: 30.0,
                padding: const EdgeInsets.only(left: 28.0),icon: const Icon(Icons.chat), onPressed: () {
                   Navigator.push(context,
          MaterialPageRoute(builder: (context) => const chat()));
                },),

            ],
          ),
        )
        
       );
}
/*
void main() => runApp(MyApp());
  
class MyApp extends StatelessWidget {
  var myMenuItems = <String>[
    'Settings',
    'Remove Ads',
    'Feature Requests',
    'Error Log',
    'Licenses',
    'About',
  ];
  void onSelect(item) {
    switch (item) {
      case 'Settings':
        print('Settings clicked');
        break;
      case 'Remove Ads':
        print('Remove Ads clicked');
        break;
      case 'Feature Requests':
        print('Feature Requests clicked');
        break;
         case 'Error Log':
        print('Error Log clicked');
        break;
         case 'Licenses':
        print('Licenses clicked');
        break;
         case 'About':
        print('About');
        break;

    }
  }
//var items = [{'name':'obs','value':0}, {'name':'stream_labs','value':1}, {'name':'manual','value':2}];
  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 28.0),
      backgroundColor: Colors.orange[900],
      visible: true,
      curve: Curves.bounceInOut,
      children: [
       SpeedDialChild(
            
          child: IconButton(iconSize:100.0,
          icon:Image.asset('images/obs.png'),
           tooltip: 'obs',
          onPressed: ()=>print("obs"))
        ),
        SpeedDialChild(
          child: IconButton(iconSize:100.0,
          icon:Image.asset('images/streamlabs_obs.png'),
           tooltip: 'streamlabs_obs',
          onPressed: ()=>print("streamlabs_obs"))
        ),
        SpeedDialChild(
           child: IconButton(iconSize:100.0,
          icon:Image.asset('images/manual.png'),
           tooltip: 'manual',
          onPressed: ()=>print("manual"))
        ),
      ],
    );
  }
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Realtime Kit"),backgroundColor: Colors.amber[400],
            actions: <Widget>[
              PopupMenuButton<String>(
                  onSelected: onSelect,
                  itemBuilder: (BuildContext context) {
                    return myMenuItems.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  })
            ],
          
        ),
      body: ColoredBox(color:Colors.grey.shade50,
         child:Column(    children: <Widget>[   Row(  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
            children: <Widget>[  
              Container(alignment: Alignment.topRight,height:100,width:100,
              child:Center(
              child: Image.asset('images/obs.png',height:80,width:80), ), ),

             
              Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topCenter,height: 100,width:100,
                child:Center(child: Text
                (  
                  'obs studio',  
                  style: TextStyle(fontSize: 20.0),
                   textAlign: TextAlign.center,  
              ), ),), 
              Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topRight,height: 100,width:100,
                child:Center(child:
              PopupMenuButton<String>(
                  onSelected: onSelect,
                  itemBuilder: (BuildContext context) {
                    return myMenuItems.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  }),),),
            ],  
          ), 
          SizedBox(
            height: 10,
            
          ),
          Row(  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
            children: <Widget>[  
              Container(alignment: Alignment.topRight,height:100,width:100,
              child:Center(
              child: Image.asset('images/streamlabs_obs.png',height:80,width:80), ), ),

             
              Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topCenter,height: 100,width:100,
                child:Center(child: Text
                (  
                  'streamlabs_obs',  
                  style: TextStyle(fontSize: 20.0),
                   textAlign: TextAlign.center,  
              ), ),), 
              Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topRight,height: 100,width:100,
                child:Center(child:
              PopupMenuButton<String>(
                
                  onSelected: onSelect,
                  itemBuilder: (BuildContext context) {
                    return myMenuItems.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  }),),),
            ],  
          ), 
             ]  ), ),
        
    floatingActionButton: buildSpeedDial(),

      bottomNavigationBar: 
      BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(iconSize: 30.0,
                icon: Icon(Icons.home), onPressed: () {},),
              
         IconButton(iconSize: 30.0,
                icon: Icon(Icons.volume_down), onPressed: () {},),
                IconButton(iconSize: 30.0,
               icon: Icon(Icons.featured_video), onPressed: () {},),
                IconButton(iconSize: 30.0,
                icon: Icon(Icons.remove_red_eye),onPressed: () {},),
                IconButton(iconSize: 30.0,
                icon: Icon(Icons.chat), onPressed: () {},),

            ],
          ),
        )
    ));
  }
}

  
  





*/