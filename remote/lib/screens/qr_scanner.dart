import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:rtkit/components/channel_provider.dart';
import 'package:rtkit/screens/control_screen.dart';

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
      body: MobileScanner(onDetect: (BarcodeCapture barcode) {
        final code = barcode.raw;
        if (code != null) {
          if (!urlRegEx.hasMatch(code)) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('This QR code is not valid, please check again!'),
            ));
            return;
          }

          final splitUrl = code.split('/');
          final channelId = splitUrl[3];

          Provider.of<ChannelModel>(context, listen: false)
              .setChannelId(channelId);

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ControlScreen(channelId: channelId)));
          return;
        }
        Navigator.of(context).pop();
      }),
    );
  }
}
