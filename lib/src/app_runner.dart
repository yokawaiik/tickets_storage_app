import 'package:flutter/material.dart';
import './app.dart';
import 'dependencies/dependencies_manager.dart';

void appRunner() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependenciesManager();

  runApp(
    App(),
  );
}
