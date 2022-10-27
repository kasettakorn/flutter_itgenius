// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/helper/shared_pref.dart';
import 'package:flutter_localization/models/app_language.dart';
import 'package:flutter_localization/providers/app_locale.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // สำหรับการเปลี่ยนภาษา
  // สร้าง Object โหลด Model สำหรับ Drop down list
  late AppLanguage dropDownValue;
  late String currentDefaultSystemLocale; // เก็บตัวภาษาจากระบบ // th_TH
  int selectedLangIndex = 0;
  late AppLocale _appLocale;

  @override
  void initState() {
    super.initState();
    dropDownValue = AppLanguage.languages().first;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appLocale = Provider.of<AppLocale>(context);

    getLocale().then((locale) {
      _appLocale.onLocaleChange(Locale(locale.languageCode));
      dropDownValue = AppLanguage.languages().firstWhere(
        (element) => element.languageCode == locale.languageCode
      );
      _setFlag();
    });
    
  }

  // ฟังก์ชันตัดคำเลือกภาษา เช่น en_EN ตัดคำเป็น en
  void _setFlag() {
    currentDefaultSystemLocale = _appLocale.locale.languageCode.split('_')[0];
    setState(() {
      selectedLangIndex = _getLangIndex(currentDefaultSystemLocale);
    });
  }

  // ฟังก์ชันสำหรับนำ index ที่ได้ไปเลือกภาษา
  int _getLangIndex(String currentDefaultSystemLocale){
    int _langIndex = 0;
    switch(currentDefaultSystemLocale){
      case 'en': _langIndex = 0; break;
      case 'th': _langIndex = 1; break;
    }
    return _langIndex;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(AppLocalizations.of(context)!.chooseLanguage),
          ),
          SizedBox(width: 8.0,),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: DropdownButton(
              dropdownColor: Colors.purple,
              iconEnabledColor: Colors.white,
              underline: Container(
                height: 0,

              ),
              onChanged: (AppLanguage? language) {
                dropDownValue = language!;
                _appLocale.onLocaleChange(Locale(language.languageCode));
                _setFlag();
                setLocale(language.languageCode);
              },
              value: dropDownValue,
              items: AppLanguage.languages()
                .map<DropdownMenuItem<AppLanguage>>(
                  (e) => DropdownMenuItem<AppLanguage>(
                    value: e,
                    child: Text(e.languageName, style: TextStyle(color: Colors.white)),
                  )
                ).toList(), 
            ),
          )
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.hello),
      ),
    );
  }
}