



// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:remote/operations.dart';
import 'package:remote/storage_util.dart';
import 'package:remote/variables.dart';
import 'package:http/http.dart' as http;
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
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',textAlign: TextAlign.center,)
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







  

  Future<void> qr1(Barcode result) async { 
 // String type=describeEnum(result.format);
 data=result.code.toString();
 //print(data);
 var arr=data!.split('/');
uuid=arr[3];
// print(uuid);
  StorageUtil.putString("uuid", uuid!);
        fetchuuid();
 
   
}
fetchuuid() async {
String s = "https://kit.rtirl.com/api/$uuid/activeAgentId";

  final response = await http.get(Uri.parse(s));

  if (response.statusCode == 200) {
    
   navigate();


    // If the server did return a 200 OK response,
    // then parse the JSON.
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Invalid uuid');
  }
}
void navigate(){
 Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Operations()));
}


}






