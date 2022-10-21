// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localization/providers/app_locale.dart';
import 'package:flutter_localization/demo_localization.dart';
import 'package:flutter_localization/models/app_language.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //สร้าง object โหลด model สำหรับ dropdown และสำหรับสลับภาษา
  late AppLanguage dropdownValue;

  // เก็บภาษาจากระบบ เช่น th_TH en_US
  late String currentDefaultSystemLocale;
  int selectedLanguageIndex = 0;
  late AppLocale _appLocale;

  @override
  void initState() {
    super.initState();
    dropdownValue = AppLanguage.languages().first;
  }

  //เมื่อมีการเปลี่ยนแปลงใน UI ให้ทำงานซ้ำ เปรียบเสมือน componentDidUpdate()
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appLocale = Provider.of<AppLocale>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              AppLocalizations.of(context)!.chooseLanguage,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: DropdownButton(
              dropdownColor: Colors.orange,
              iconEnabledColor: Colors.white,
              underline: Container(height: 0),
              onChanged: (AppLanguage? language) {
                dropdownValue = language!;
                _appLocale.onLocaleChange(Locale(language.languageCode));
              },
              value: dropdownValue,
              items: AppLanguage.languages()
                  .map<DropdownMenuItem<AppLanguage>>(
                    (language) => DropdownMenuItem<AppLanguage>(
                      value: language,
                      child: Text(
                        language.languageName,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
      body: Center(child: DemoLocalizationScreen()),
    );
  }
}
