import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
var items = [{'name':'obs','value':0}, {'name':'stream_labs','value':1}, {'name':'manual','value':2}];
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
           tooltip: 'obs',
          onPressed: ()=>print("streamlabs_obs"))
        ),
        SpeedDialChild(
           child: IconButton(iconSize:100.0,
          icon:Image.asset('images/manual.png'),
           tooltip: 'obs',
          onPressed: ()=>print("manual"))
        ),
      ],
    );
  }
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ReaLTime Kit"),backgroundColor: Colors.amber[400],
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
                padding: EdgeInsets.only(left: 28.0),icon: Icon(Icons.home), onPressed: () {},),
              
         IconButton(iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),icon: Icon(Icons.volume_down), onPressed: () {},),
                IconButton(iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),icon: Icon(Icons.featured_video), onPressed: () {},),
                IconButton(iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),icon: Icon(Icons.remove_red_eye),onPressed: () {},),
                IconButton(iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),icon: Icon(Icons.chat), onPressed: () {},),

            ],
          ),
        )
    ));
  }
}

  
  





