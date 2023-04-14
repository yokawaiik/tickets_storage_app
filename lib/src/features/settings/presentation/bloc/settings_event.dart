part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SetInitialSettingsEvent extends SettingsEvent {}

class SetLocaleSettingsEvent extends SettingsEvent {
  final LocaleVariant locale;

  const SetLocaleSettingsEvent(this.locale);
}
