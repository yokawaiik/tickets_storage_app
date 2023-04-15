import 'package:documents_saver_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
    final t = context.read<SettingsBloc>().state.t;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.strings.settingsPage.appbar.title),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        bloc: _settingsBloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2<LocaleVariant>(
                    value: state.currentLocale,
                    isExpanded: true,
                    items: [
                      ...LocaleVariant.values
                          .map(
                            (locale) => DropdownMenuItem(
                              value: locale,
                              child: Text(t.strings.settingsPage
                                  .locales[locale.index].title as String),
                            ),
                          )
                          .toList()
                    ],
                    onChanged: (value) => _setLocale(context, value),
                    buttonStyleData: const ButtonStyleData(
                      height: 48,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      offset: Offset(0, 20),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 48,
                    ),
                  ),
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
