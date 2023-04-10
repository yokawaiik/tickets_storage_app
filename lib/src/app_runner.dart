import 'package:flutter/material.dart';
import './app.dart';
import './di/dependencies_injector.dart';

void appRunner() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependenciesInjector();
  runApp(App());
}
