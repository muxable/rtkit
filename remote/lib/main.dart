


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:remote/operations.dart';
import 'package:remote/qr_code.dart';
import 'package:provider/provider.dart';
import 'package:remote/settings.dart';
import 'package:remote/size.dart';
import 'package:remote/variables.dart';
import 'theme_model.dart';
import 'package:remote/storage_util.dart';
import 'package:http/http.dart' as http;



//void main() => runApp(const MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
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
       

        home: const MainPage(),
       
        );},));
  }
}

class MainPage extends StatefulWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
final uuidController = TextEditingController();

 
  _setText() async {
    setState(() {
      print('hi');
      uuid = uuidController.text;
      StorageUtil.putString("uuid", uuid!);
      fetchuuid();
      if (kDebugMode) {
        print(uuid);
      }

       // ignore: unnecessary_brace_in_string_interps
       

    });
  }
fetchuuid() async {
String s = "https://kit.rtirl.com/api/$uuid/activeAgentId";

  final response = await http
      .get(Uri.parse(s));

  if (response.statusCode == 200) {
    
    Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Operations()));


    // If the server did return a 200 OK response,
    // then parse the JSON.
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Invalid uuid');
  }
}


  @override
  Widget build(BuildContext context) => Scaffold(

  
    appBar:   AppBar(
  centerTitle: true,
  title: const Text('Real Time Kit'),
  leading: IconButton(
    onPressed: () {},
    icon: const Icon(Icons.home),
  ),
  actions: [
    IconButton(
      onPressed: () {

 Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  const SettingsPage()));
      },
      icon: const Icon(Icons.settings,
    ),),
    
  ]
),
          body:
           SizedBox(
            height:displayHeight(context)-
                 MediaQuery.of(context).padding.top -
                 kToolbarHeight,width:displayWidth(context),
          
          
        child:  Column(    
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[   
            SizedBox(height:displayHeight(context)*0.05,width:displayWidth(context)*0.9,),
            // const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Center(
              child: Image.asset('images/obs.png',height:displayHeight(context)*0.1,width:displayWidth(context)*0.2, ),
              ),
              SizedBox(height:displayHeight(context)*0.05,width:displayWidth(context)*0.9,),
              //const Flexible(fit: FlexFit.tight, child: SizedBox()),
               Center(child: Text
                (  
                  'OBS studio Real time kit',  
                 style: TextStyle(
              fontSize: displayHeight(context)*0.025,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 29, 14, 14)))
              ), 
           SizedBox(height:displayHeight(context)*0.05,width:displayWidth(context)*0.9,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
     SizedBox(height:displayHeight(context)*0.05,width:displayWidth(context)*0.7,
      
              child:   FloatingActionButton.extended(icon:const Icon(Icons.camera_alt),
           label:const Text("Scan"),
           onPressed:() { 
           
                     Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Qrcode()));
           
           },), ),]),
             SizedBox(height:displayHeight(context)*0.01,width:displayWidth(context)*0.9,),
            SizedBox(height:displayHeight(context)*0.05,width:displayWidth(context)*0.7,
                  child: const Center(child: Text
                (  
                  'OR',  
                 style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 29, 14, 14)))
              ),),
               SizedBox(height:displayHeight(context)*0.01,width:displayWidth(context)*0.9,),
           // ignore: sized_box_for_whitespace
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[ SizedBox(
             height:displayHeight(context)*0.05,width:displayWidth(context)*0.9,
         child: TextField(
              decoration: const InputDecoration(labelText: 'Enter the UUID ', border: OutlineInputBorder(),
              
              contentPadding: EdgeInsets.symmetric(vertical: 10)
              ),
              controller: uuidController,
               maxLines: 5, 
  minLines: 1, 

  
            ),),]),
          SizedBox(height:displayHeight(context)*0.05,width:displayWidth(context)*0.9,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
          SizedBox( 
            height:displayHeight(context)*0.05,width:displayWidth(context)*0.5,
      child:    ElevatedButton(
        
            
              onPressed: _setText,
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(3),),
                //  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              child: const Text('Submit')),),
            ]  ),
           
           
           
           ]
          )));}
























/*
import 'package:flutter/material.dart';
import 'package:remote/qr_code.dart';
import 'package:provider/provider.dart';
import 'package:remote/settings.dart';
import 'package:remote/size.dart';
import 'package:remote/variables.dart';
import 'theme_model.dart';
import 'package:remote/storage_util.dart';


//void main() => runApp(const MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  


  @override
  Widget build(BuildContext context) {
  
     
     return ChangeNotifierProvider(create:(_)=>ThemeModel(),

//double height = MediaQuery.of(context).size.height;



    child:Consumer( 
      builder: (context,ThemeModel themeNotifier,child){ 
        return MaterialApp(
          theme:themeNotifier.isDark?ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        title:'Real Time Kit',
       

        home: const MainPage(),
       
        );},));
  }
}



class MainPage extends StatefulWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
final uuidController = TextEditingController();
  String text = "No Value Entered";
 
  _setText() async {
    setState(() {
      text = uuidController.text;
      StorageUtil.putString("uuid", uuid!);
      print(uuid);

    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(

  
    appBar:   AppBar(
  centerTitle: true,
  title: const Text('Real Time Kit'),
  leading: IconButton(
    onPressed: () {},
    icon: const Icon(Icons.home),
  ),
  actions: [
    IconButton(
      onPressed: () {

 Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  const SettingsPage()));

      },
      icon: const Icon(Icons.settings,
    ),),
    
  ]
),
          body:
          Container(
           // height:displayHeight(context)-
                 // MediaQuery.of(context).padding.top -
                 // kToolbarHeight,width:displayWidth(context),
child:Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.stretch,

          
          children: <Widget>[   
           const SizedBox(height:10,width:10),
            // const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topRight,height:displayHeight(context)*0.1 -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,width:displayWidth(context) * 0.3,
              child:Center(
              child: Image.asset('images/obs.png',height:140,width:140), ), ),

              const SizedBox(height:10,width:10),
              //const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topCenter,height:displayHeight(context)*0.15 -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,width:displayWidth(context) * 0.5,
                child:const Center(child: Text
                (  
                  'OBS studio Real time kit',  
                 style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 29, 14, 14)))
              ), ),
           const SizedBox(height:40,width:30),
     SizedBox(
      height:displayHeight(context)*0.2 -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,width:displayWidth(context) * 0.8,
              child:   FloatingActionButton.extended(icon:const Icon(Icons.camera_alt),
           label:const Text("Scan"),
           
           onPressed:() { 
           
                     Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Qrcode()));
           
           },),),
            const SizedBox(
            height: 10,width:10,
          ),
          Container(
                  child: Center(child: Text
                (  
                  'OR',  
                 style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 29, 14, 14)))
              ),),
               const SizedBox(
            height: 10,width:10,
          ),
           // ignore: sized_box_for_whitespace
           Container(
              height:displayHeight(context)*0.3 -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,width:displayWidth(context) * 0.5,
         child: TextField(
              decoration: const InputDecoration(labelText: 'Enter UUID number', border: OutlineInputBorder(),
              
              contentPadding: EdgeInsets.symmetric(vertical: 10)
              ),
              controller: uuidController,
               maxLines: 5, 
  minLines: 1, 

  
            ),),
          
      
          Container( height:displayHeight(context)*0.2 -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,width:displayWidth(context) * 0.5,
      child:    ElevatedButton(
        
            
              onPressed: _setText,
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(3),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              child: const Text('Submit')),),
            /*  const TextField(
                controller:uuidcontroller,
                onChanged: (text){ 
                  this.setState(() { 
                    uuid=text;
                  });
                },
  decoration: InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.all( 
      const Radius.circular(10)
    )),
    hintText: 'Enter the UUID number',
  ),
),*/

  

           
           ]
           
  )));}
          /*
           Column(    
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.stretch,

          
          children: <Widget>[   
           SizedBox(height:20,width:30),
            // const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topRight,height:100,width:100,
              child:Center(
              child: Image.asset('images/obs.png',height:140,width:140), ), ),

             
              //const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Container(alignment: Alignment.topCenter,height: 200,width:500,
                child:const Center(child: Text
                (  
                  'OBS studio Real time kit',  
                 style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 29, 14, 14)))
              ), ),
          
     
                 FloatingActionButton.extended(icon:const Icon(Icons.camera_alt),
           label:const Text("Scan"),
           onPressed:() { 
           
                     Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Qrcode()));
           
           },),
           
             const Divider(
              height: 15,
              thickness: 2,
            ),/*
       Text('Make sure its configured like this:',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 29, 14, 14))),
                       const Divider(
              height: 15,
              thickness: 2,
            ),
          

       Expanded(child: Image.asset('images/obs_ins.png',height:700,width:600),)
            */
          
             ] , 
             
             
         
             
         ),
         
         
         
         );
       
       
  
       
}
*/
/*GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 1,
  children: <Widget>[
    Container(
      //padding: const EdgeInsets.all(8),
     // color: Color.fromARGB(255, 211, 209, 222),
      child:   Column( children:[
        SizedBox(height:20,width:20),
      Image.asset('images/obs.png',height:200,width:200),
      
                SizedBox(height:40,width:20),
      
      const Center(child: Text
                (  
                  'OBS studio Real time kit',  

                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

               // SizedBox(height:20,width:20),
  ]),),




    ElevatedButton.icon(
                    onPressed: () async {
                  Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Qrcode()));
                    },
                    icon: const Icon(
                        Icons.camera_alt),//icon data for elevated button
                    label: const Text("Scan"), //label text
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 86, 84, 86),
                     // minimumSize: const Size(175, 40),
                     // maximumSize: const Size(175, 40),
                    )),

  
  ],
),*/*/