// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';

const List<String> fruits = [
  'Apple',
  'Banana',
  'Mango',
  'Orange',
  'Papaya',
  'Strawberry'
];

class CupertinoPickerDemo extends StatefulWidget {
  const CupertinoPickerDemo({super.key});

  @override
  State<CupertinoPickerDemo> createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<CupertinoPickerDemo> {
  int _selectedFruit = 2;

  void _showPicker(Widget child) {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) => Container(
        height: 210,
        padding: EdgeInsets.only(top: 8),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Picker'),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected fruit'),
            CupertinoButton(
                onPressed: () => _showPicker(
                      CupertinoPicker(
                        itemExtent: 35,
                        onSelectedItemChanged: (int selectedItem) {
                          setState(() {
                            _selectedFruit = selectedItem;
                          });
                        },
                        children: List.generate(fruits.length, (index) {
                          return Center(
                            child: Text(fruits[index]),
                          );
                        }),
                      ),
                    ),
                child: Text(
                  fruits[_selectedFruit],
                  style: TextStyle(fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
