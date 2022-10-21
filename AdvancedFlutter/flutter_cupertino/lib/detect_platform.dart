// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';

class DetectPlatform extends StatelessWidget {
  const DetectPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Universal Platform'),
      ),
      child: Center(
        child: Text('''
          Web: ${UniversalPlatform.isWeb}
          iOS: ${UniversalPlatform.isIOS}
          Android: ${UniversalPlatform.isAndroid}
          Linux: ${UniversalPlatform.isLinux}
          MacOS: ${UniversalPlatform.isMacOS}
          Windows: ${UniversalPlatform.isWindows}
          Fuchsia: ${UniversalPlatform.isFuchsia}
          '''),
      ),
    );
  }
}
