

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:remote/operations.dart';
import 'package:remote/storage_util.dart';
import 'package:remote/variables.dart';
class Qrcode extends StatefulWidget {
  const Qrcode({Key? key}) : super(key: key);

  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  // ignore: prefer_const_constructors
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );


    
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    
    controller.scannedDataStream.listen((scanData) {
      setState(()  {
      // dispose();
       controller.pauseCamera();
        result = scanData;
        //res=scanData.toString();
      //  print(result);
        qr1(result!);
       
        //if(result!.code==)
      });
    }
    );


  }



  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }







  
/*
Future<void> qr (Barcode result) async {
  String res;
  res=result.toString();
  SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("backendURL",res); 
    print("the backend url is");
    print(res);
*/


/*
  getBackendURL() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString(backendURL);
    return res;
  }*/
  Future<void> qr1(Barcode result) async { 
 // String type=describeEnum(result.format);
 data=result.code.toString();
StorageUtil.putString("url", data!);
  
 
    //SharedPreferences pref = await SharedPreferences.getInstance();
 //   pref.setString("data",data); 
//print('string is $data');

var arr=data!.split('/');

navigate(arr);

//print(type);

 //print("New String: ${result.code!.split('/')}");

//print(data);


//var array=result?.code!.split('/');

}
void navigate(List<String> arr) {
  if(arr[2]=='kit.rtirl.com' )
{
 
  
  Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Operations()));

}
   
}

}




