// ignore_for_file: prefer_conditional_assignment

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Utility {
  static Utility? utility;

  static Utility? getInstance() {
    if (utility == null) {
      utility = Utility();
    }

    return utility;
  }

  //alert popup
  showAlertDialog(BuildContext context, String title, String content) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('ตกลง'),
        ),
      ],
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => alert);
  }

  //Check network connectivity
  Future<String> checkNetworkConnection() async {
    var checkNetwork = await Connectivity().checkConnectivity();

    if (checkNetwork == ConnectivityResult.mobile) {
      return 'Connected with cellular';
    } else if (checkNetwork == ConnectivityResult.bluetooth) {
      return 'Connected with bluetooth';
    } else if (checkNetwork == ConnectivityResult.wifi) {
      return 'Connected with Wi-Fi';
    } else if (checkNetwork == ConnectivityResult.ethernet) {
      return 'Connected with Ethernet LAN';
    } else if (checkNetwork == ConnectivityResult.none) {
      return 'No internet connection';
    }
    return '';
  }
}
