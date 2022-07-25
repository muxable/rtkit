

import 'package:flutter/material.dart';
import 'package:remote/qr_code.dart';
import 'package:provider/provider.dart';
import 'package:remote/settings.dart';
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
          body:Column(    
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.stretch,

          
          children: <Widget>[   
           const SizedBox(height:20,width:30),
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
           
  ));}
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
),*/