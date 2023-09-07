import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:your_flutter_app/my_app.dart';
import 'package:your_flutter_app/core/localization/languages_class.dart';
import 'package:your_flutter_app/core/shared/constants/translation_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      // Path for the JSON folder like: 'assets/translations'
      path: TranslationsConstants.assetsTranslations,
      supportedLocales: Languages.all,
      fallbackLocale: Languages.english,
      child: const MyApp(),
    ),
  );
}
