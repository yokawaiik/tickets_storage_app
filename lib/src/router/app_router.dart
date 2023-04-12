import 'package:documents_saver_app/src/router/router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../features/ticket_storage/presentation/bloc/tickets_bloc.dart';
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
          // builder: (context, goRouterState) {
          //   return BlocListener<AuthenticationCubit, AuthenticationState>(
          //     listener: (ctx, state) {
          //       if (state is! AuthenticatedState) {
          //         context.pushReplacementNamed(routes_constants.auth);
          //       }
          //     },
          //     child: const HomeScreen(),
          //   );
          // },
          builder: (context, goRouterState) {
            return TicketStoragePage();
          },
        ),
        GoRoute(
          name: routes_constants.ticketDetailPage,
          path: routes_constants.ticketDetailPagePath,
          builder: (context, state) {
            // final ticketId = state
            //     .queryParams[routes_constants.ticketDetailPageQueryParamIdPath];
            // final ticketId = state
            //     .queryParams[routes_constants.ticketDetailPageQueryParamIdPath];

            final queryParams =
                TicketDetailPageQueryParams.fromParamsMap(state.queryParams);

            return TicketDetailPage(queryParams: queryParams);
          },
        ),
        // GoRoute(
        //   name: routes_constants.error,
        //   path: routes_constants.errorPath,
        //   builder: (context, state) {
        //     return const ErrorScreen();
        //   },
        // ),
      ],
    );
  }
}
