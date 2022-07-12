// ignore_for_file: camel_case_types, avoid_print

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
class qr_code extends StatefulWidget {
  const qr_code({Key? key}) : super(key: key);

  @override
  State<qr_code> createState() => _qr_codeState();
}

class _qr_codeState extends State<qr_code> {

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
        result = scanData;
        //res=scanData.toString();
        qr1(result!);
   
      });
    });
     

  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
Future<void> qr (Barcode result) async {
  String res;
  res=result.toString();
  SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("backendURL",res); 
    print("the backend url is");
    print(res);
}
Future<void> qr1(Barcode result) async { 
  String type=describeEnum(result.format);
  String data=result.code.toString();
  SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("Barcode type",type); 
    SharedPreferences pref1 = await SharedPreferences.getInstance();
    pref1.setString("data",data); 
print(type);
print(data);
}