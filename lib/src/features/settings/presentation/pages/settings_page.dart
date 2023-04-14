import 'package:documents_saver_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../i18n/translations.g.dart';
import '../../domain/enums/locale_variant.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final _settingsBloc = GetIt.I.get<SettingsBloc>();

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.settingsPage.appbar.title),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        bloc: _settingsBloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DropdownButton<LocaleVariant>(
                  value: state.currentLocale,
                  isExpanded: true,
                  items: [
                    ...LocaleVariant.values
                        .map(
                          (locale) => DropdownMenuItem(
                            value: locale,
                            child: Text(t.settingsPage.locales[locale.index]
                                .title as String),
                          ),
                        )
                        .toList()
                  ],
                  onChanged: (value) => _setLocale(context, value),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _setLocale(BuildContext context, LocaleVariant? locale) {
    if (locale == null) return;

    _settingsBloc.add(SetLocaleSettingsEvent(locale));
  }
}
