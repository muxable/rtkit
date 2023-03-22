import 'package:flutter/material.dart';
import 'package:rtkit/qr_scanner.dart';
import 'package:rtkit/setup.dart';
import 'package:rtkit/themes.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Text(
                'REALTIMEKIT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
                  fontFamily: 'HansonBold',
                  color: primaryColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton.extended(
                        heroTag: null,
                        backgroundColor: primaryColor,
                        icon: const Icon(
                          Icons.info_outline,
                          color: offBlackColor,
                        ),
                        label: const Text(
                          "SETUP APP",
                          style: TextStyle(
                            color: offBlackColor,
                            fontFamily: 'Oskari G2',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Setup(),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton.extended(
                        heroTag: null,
                        backgroundColor: primaryColor,
                        icon: const Icon(
                          Icons.qr_code_scanner_sharp,
                          color: offBlackColor,
                        ),
                        label: const Text(
                          "SCAN QR CODE",
                          style: TextStyle(
                            color: offBlackColor,
                            fontFamily: 'Oskari G2',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QRScanner(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
