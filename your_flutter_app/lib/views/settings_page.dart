import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:your_flutter_app/core/localization/languages_class.dart';
import 'package:your_flutter_app/core/shared/utils/media_query.dart';
import 'package:your_flutter_app/providers/language_provider.dart';
import 'package:your_flutter_app/providers/theme_provider.dart';
import 'package:your_flutter_app/views/settings_page/widgets/row_card_widget.dart';
import 'package:your_flutter_app/views/shared_views/widgets/switch_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LanguageProvider>(
      builder: (_, themeProvider, languageProvider, __) => Scaffold(
        body: ListView(
          padding: EdgeInsets.all(getWidth() * 0.035),
          children: [
            RowCardWidget(
              title: "Dark Theme",
              widget: SwitchWidget(
                value: themeProvider.isDark,
                onChanged: () => themeProvider.changeTheme(),
              ),
            ),
            RowCardWidget(
              // --------------- translate "language" word here --------------- //
              title: "language".tr(),
              // ------------------------ ---------- -------------------------- //
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButton<String>(
                  dropdownColor: Colors.grey,
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 25,
                  ),
                  iconSize: 18,
                  elevation: 16,
                  value: languageProvider.dropdownValue,
                  onChanged: (val) =>
                      languageProvider.changeLanguage(context, val!),
                  items: Languages.languages
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
