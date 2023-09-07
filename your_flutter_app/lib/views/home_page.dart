import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_flutter_app/core/shared/utils/media_query.dart';
import 'package:your_flutter_app/providers/language_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //?: Consumer<LanguageProvider>: Just for listening to "LanguageProvider"
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, __) => Scaffold(
        body: ListView(
          padding: EdgeInsets.all(getWidth() * 0.04),
          children: [
            // ---------------- translate "HomePage" ------------ //
            Text("HomePage".tr()),
          ],
        ),
      ),
    );
  }
}
