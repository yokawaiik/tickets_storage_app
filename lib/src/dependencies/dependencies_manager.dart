import 'package:documents_saver_app/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '../features/settings/data/storage/settings_storage.dart';
import '../features/ticket_storage/presentation/bloc/tickets_bloc.dart';
import '../theme/theme.dart';

import '../router/app_router.dart';

Future<void> dependenciesManager() async {
  try {
    // main or global
    GetIt.I.registerLazySingleton<AppRouter>(() => AppRouter());
    GetIt.I.registerLazySingleton<AppTheme>(() => AppTheme());

    // feature settings
    GetIt.I.registerLazySingleton<SettingsBloc>(() => SettingsBloc());

    // feature ticket_storage
    GetIt.I.registerLazySingleton<TicketsBloc>(() => TicketsBloc(
          settingsBloc: GetIt.I.get<SettingsBloc>(),
        ));
  } catch (e) {
    debugPrint("Dependencies - error: $e");
    rethrow;
  }
}
