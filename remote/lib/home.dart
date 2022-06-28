import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'alert.dart';
  

class class1 extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("OBS Studio"),
          centerTitle: true,
          actions: [
              
             Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white),
                textTheme: TextTheme().apply(bodyColor: Colors.white),
              ),
               child: PopupMenuButton<int>(
                color: Colors.indigo,
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                 
                  
                       PopupMenuItem<int>(
                        value:0,
                        child:Text('Settings'),
                      ),
                    PopupMenuItem<int>(
                        value:1,
                        child:Text('Remove Ads'),
                      ),
                       PopupMenuItem<int>(
                        value:2,
                        child:Text('Feature Requests'),
                      ),
                       PopupMenuItem<int>(
                        value:3,
                        child:Text('Error Log'),
                      ),
                        PopupMenuItem<int>(
                        value:4,
                        child:Text('Licenses'),
                      ),
                        PopupMenuItem<int>(
                        value:5,
                        child:Text('About'),
                      ),
                ],
              ),

            ),
          ],
        ),
        body:Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
            Text(  "Add a browser source in OBS: https://kit.rtirl.com/b210343d-60da-418c-a824-1def9907afcd"

            ),
        Image.asset('images/qr_code.png',height:200,width:200),
        Text(  
          "Make sure it's configured like this:"
        ),
        Image.asset('images/obs_ins.png',height:100,width:200),
        

          ],
        ),
  );
}
void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      case 1:
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      case 2:
        print('Feature Requests clicked');
        break;
      case 3:
        print('Error Log clicked');
        break;
      case 4:
        print('Licenses clicked');
        break;
      case 5:
        print('About');
        break;
      case 6:
        _showDialog1(context);
        break;
      case 7:
        
        break;
        
               
  
    }
    
  }
    void _showDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Remove host"),
          content: Text("Are you sure you want to remove this connection?"),
          actions: [
               TextButton(
              onPressed: () => Navigator.pop(context, 'NO'),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'YES'),
              child: const Text('YES'),
            ),
          ],
        );
      },
    );
  }
  

