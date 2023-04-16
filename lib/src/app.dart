import 'package:documents_saver_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import './theme/theme.dart';

import 'i18n/translations.g.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = GetIt.I.get<AppRouter>();

  final _appTheme = GetIt.I.get<AppTheme>();
  final _settingsBloc = GetIt.I.get<SettingsBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _settingsBloc),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        /// [SettingsBloc] is available for every widget in the app
        bloc: _settingsBloc..add(SetInitialSettingsEvent()),
        builder: (context, state) {
          return MaterialApp.router(
            locale: state.currentAppLocale.flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            title: state.t.strings.appName,
            theme: _appTheme.theme,
            darkTheme: _appTheme.darkTheme,
            routerConfig: _appRouter.config,
          );
        },
      ),
    );
  }
}
