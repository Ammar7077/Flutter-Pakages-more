import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:your_flutter_app/providers/bottom_nav_bar_provider.dart';
import 'package:your_flutter_app/nav_bar_handler.dart';
import 'package:your_flutter_app/core/theme/dark_theme.dart';
import 'package:your_flutter_app/core/theme/light_theme.dart';
import 'package:your_flutter_app/providers/language_provider.dart';
import 'package:your_flutter_app/providers/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LanguageProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your Flutter App Title',
          //------------------ language ------------------//
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // --------- ------------------- -------------- //
          //? Theme
          darkTheme: getDarkTheme(),
          theme: themeProvider.isDark ? getDarkTheme() : getLightTheme(),
          // ---------
          home: const NavBarHandler(),
        ),
      ),
    );
  }
}
