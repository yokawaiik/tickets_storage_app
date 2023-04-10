import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import './theme/theme.dart';

import 'router/app_router.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = GetIt.I.get<AppRouter>();
  final _appTheme = GetIt.I.get<AppTheme>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tickets',
      theme: _appTheme.theme,
      routerConfig: _appRouter.config,
    );
  }
}
