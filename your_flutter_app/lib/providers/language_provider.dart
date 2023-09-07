import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:your_flutter_app/core/localization/languages_class.dart';

class LanguageProvider extends ChangeNotifier {
  String dropdownValue = 'English';

  Future<void> changeLanguage(BuildContext context, String val) async {
    dropdownValue = val;
    if (val == 'English') {
      await context.setLocale(Languages.english);
    } else if (val == 'Spanish') {
      await context.setLocale(Languages.spanish);
    } else if (val == 'عربي') {
      await context.setLocale(Languages.arabic);
    } else if (val == 'Turkish') {
      await context.setLocale(Languages.turkish);
    } else if (val == 'Russian') {
      await context.setLocale(Languages.russian);
    }
    notifyListeners();
  }
}
