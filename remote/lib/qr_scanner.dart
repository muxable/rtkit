import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rtkit/control_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QRScanner extends StatelessWidget {
  final SharedPreferences prefs;

  const QRScanner({Key? key, required this.prefs}) : super(key: key);

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
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) {
          final code = barcode.rawValue;
          if (code != null) {
            if (!urlRegEx.hasMatch(code)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text('This QR code is not valid, please check again!'),
                ),
              );
              return;
            }

            final splitUrl = code.split('/');
            final channelId = splitUrl[3];

            prefs.setString('channelId', channelId);

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    ControlScreen(channelId: channelId, prefs: prefs),
              ),
            );
            return;
          }
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
