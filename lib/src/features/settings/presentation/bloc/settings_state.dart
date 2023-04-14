part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  final LocaleVariant currentLocale;

  AppLocale get currentAppLocale => indexToAppLocale(currentLocale.index);

  const SettingsState({
    this.currentLocale = LocaleVariant.auto,
  });

  @override
  List<Object> get props => [currentLocale];
}

class InitialSettingsState extends SettingsState {}

class SettedSettingsState extends SettingsState {
  const SettedSettingsState({
    LocaleVariant currentLocale = LocaleVariant.auto,
  }) : super(currentLocale: currentLocale);
}

class ErrorSettingsState extends SettingsState {
  final Object error;

  const ErrorSettingsState(
    this.error, {
    LocaleVariant currentLocale = LocaleVariant.auto,
  }) : super(currentLocale: currentLocale);
}
