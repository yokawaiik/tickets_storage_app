import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import './theme/theme.dart';

import 'i18n/translations.g.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = GetIt.I.get<AppRouter>();
  final _appTheme = GetIt.I.get<AppTheme>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale, // use provider
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      // title: 'Tickets',
      title: t.appName,
      theme: _appTheme.theme,
      routerConfig: _appRouter.config,
    );
  }
}
