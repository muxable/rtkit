import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rtkit/operations.dart';
import 'package:rtkit/storage_util.dart';
import 'package:rtkit/variables.dart';

class QRScanner extends StatelessWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urlRegEx = RegExp(
        r'https?:\/\/?kit.rtirl.com\/(?:[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})');

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
            onDetect: (barcode, args) {
              final code = barcode.rawValue;
              if (code != null) {
                if (!urlRegEx.hasMatch(code)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text('This QR code is not valid, please check again!'),
                  ));
                  return;
                }

                final splitUrl = code.split('/');
                uuid = splitUrl[3];
                StorageUtil.putString("uuid", uuid!);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Operations()));
                return;
              }
              Navigator.of(context).pop();
            }),
      ),
    );
  }
}
