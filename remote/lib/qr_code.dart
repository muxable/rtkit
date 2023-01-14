import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
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
  final urlRegEx = RegExp(
      r'https?:\/\/?kit.rtirl.com\/(?:[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Expanded(
        child: MobileScanner(
            allowDuplicates: false,
            onDetect: (barcode, args) async {
              final code = barcode.rawValue;
              if (code != null) {
                if (!urlRegEx.hasMatch(code)) {
                  _showErrorSnackBar();
                }

                final splitUrl = code.split('/');
                uuid = splitUrl[3];
                StorageUtil.putString("uuid", uuid!);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Operations()));
              }
              Navigator.of(context).pop();
            }),
      ),
    );
  }

  void _showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('This QR code is not valid, please check again!'),
    ));
  }
}
