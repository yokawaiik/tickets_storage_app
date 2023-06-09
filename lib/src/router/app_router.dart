import 'package:documents_saver_app/src/router/router.dart';
import 'package:go_router/go_router.dart';
import '../features/settings/settings.dart';
import '../features/ticket_storage/ticket_storage.dart';

import 'routes_constants.dart' as routes_constants;

class AppRouter {
  late final GoRouter config;

  AppRouter() {
    config = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: routes_constants.ticketsPagePath,
      routes: [
        GoRoute(
          name: routes_constants.ticketsPage,
          path: routes_constants.ticketsPagePath,
          builder: (context, goRouterState) {
            // final queryParams = TicketStoragePageQueryParams.fromParamsMap(
            //     goRouterState.queryParams);

            return const TicketStoragePage(
                // queryParams: queryParams,
                );
          },
        ),
        GoRoute(
          name: routes_constants.ticketDetailPage,
          path: routes_constants.ticketDetailPagePath,
          builder: (context, goRouterState) {
            final queryParams = TicketDetailPageQueryParams.fromParamsMap(
                goRouterState.queryParams);

            return TicketDetailPage(queryParams: queryParams);
          },
        ),
        GoRoute(
          name: routes_constants.settingsPage,
          path: routes_constants.settingsPagePath,
          builder: (context, state) {
            return SettingsPage();
          },
        ),
      ],
    );
  }
}
