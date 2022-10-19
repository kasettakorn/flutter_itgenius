// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:scan/scan.dart';
import 'package:images_picker/images_picker.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _platformVersion = 'Unknown';

  String qrcode = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Scan.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Running on: $_platformVersion\n'),
        Wrap(
          children: [
            ElevatedButton(
              child: Text("parse from image"),
              onPressed: () async {
                List<Media>? res = await ImagesPicker.pick();
                if (res != null) {
                  String? str = await Scan.parse(res[0].path);
                  if (str != null) {
                    print(str);
                    setState(() {
                      qrcode = str;
                    });
                  }
                }
              },
            ),
            ElevatedButton(
              child: Text('go scan page'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ScanPage();
                }));
              },
            ),
          ],
        ),
        Text('scan result is $qrcode'),
      ],
    );
  }
}

class ScanPage extends StatelessWidget {
  ScanController controller = ScanController();

  ScanPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Stack(
          children: [
            ScanView(
              controller: controller,
              scanAreaScale: .7,
              scanLineColor: Colors.green,
              onCapture: (data) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text('scan result'),
                      ),
                      body: Center(
                        child: Text(data),
                      ),
                    );
                  },
                )).then((value) {
                  controller.resume();
                });
              },
            ),
            Positioned(
              bottom: 0,
              child: Row(
                children: [
                  ElevatedButton(
                    child: Text("toggleTorchMode"),
                    onPressed: () {
                      controller.toggleTorchMode();
                    },
                  ),
                  ElevatedButton(
                    child: Text("pause"),
                    onPressed: () {
                      controller.pause();
                    },
                  ),
                  ElevatedButton(
                    child: Text("resume"),
                    onPressed: () {
                      controller.resume();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
