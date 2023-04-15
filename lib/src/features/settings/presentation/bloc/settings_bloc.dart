import 'package:bloc/bloc.dart';
import 'package:documents_saver_app/src/features/settings/settings.dart';
import 'package:documents_saver_app/src/i18n/translations.g.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/enums/locale_variant.dart';
import '../../utils/utils.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  late final SettingsRepository _settingsRepository;

  SettingsBloc() : super(InitialSettingsState()) {
    _settingsRepository = SettingsRepository();

    on<SetInitialSettingsEvent>((event, emit) async {
      try {
        debugPrint("Set up initial settings.");

        final initalLocale = await _settingsRepository.getLocale();
        emit(SettedSettingsState(currentLocale: initalLocale));
      } catch (e) {
        debugPrint("SettingsBloc - SetInitialSettingsEvent - e: $e");
        emit(ErrorSettingsState(state.t.errorStrings.unexpected));
      }
    });

    on<SetLocaleSettingsEvent>((event, emit) async {
      try {
        debugPrint("Locale was changed on: ${event.locale.name}.");

        final locale = await _settingsRepository.setLocale(event.locale);
        emit(SettedSettingsState(currentLocale: locale));
      } catch (e) {
        debugPrint("SettingsBloc - SetLocaleSettingsEvent - e: $e");
        emit(ErrorSettingsState(state.t.errorStrings.unexpected));
      }
    });
  }
}
