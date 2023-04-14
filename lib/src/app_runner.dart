import 'package:flutter/material.dart';
import './app.dart';
import 'dependencies/dependencies_manager.dart';
import 'i18n/translations.g.dart';

void appRunner() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependenciesManager();

  LocaleSettings.useDeviceLocale();

  runApp(
    TranslationProvider(
      child: App(),
    ),
  );
}
