import 'package:expenses_app/modules/views/despesas_page.dart';
import 'package:expenses_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/splash/splash_page.dart';

class Routes {
  static Future<String?> redirect(
      BuildContext context, GoRouterState state) async {
    return RouteNamesNavigation.home;
  }

  static final router = GoRouter(
    initialLocation: RouteNamesNavigation.splash,
    redirect: redirect,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
          path: RouteNames.homePage,
          builder: (context, state) => const DespesasPage()),
    ],
  );
}
