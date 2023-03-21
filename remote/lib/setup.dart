import 'package:flutter/material.dart';

class Setup extends StatefulWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
      ),
      body: const Center(
        child: Text(
            'Visit kit.rtirl.com on your computer to setup the app then scan the QR code with the mobile app and follow the instructions.'),
      ),
    );
  }
}
