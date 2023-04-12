import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '../features/ticket_storage/presentation/bloc/tickets_bloc.dart';
import '../theme/theme.dart';

import '../router/app_router.dart';

Future<void> dependenciesManager() async {
  try {
    GetIt.instance.registerLazySingleton<AppRouter>(() => AppRouter());

    GetIt.instance.registerLazySingleton<AppTheme>(() => AppTheme());

    /// feature ticket_storage
    GetIt.instance.registerLazySingleton<TicketsBloc>(() => TicketsBloc());
  } catch (e) {
    debugPrint("Dependencies - error: $e");
    rethrow;
  }
}
