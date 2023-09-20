import 'package:beatflow/screens/auth_screen.dart';
import 'package:beatflow/screens/splash_screen.dart';
import 'package:beatflow/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

var routerProvider = Provider(
  (ref) => GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: [
          GoRoute(
            path: 'auth',
            builder: (ctx, state) => const AuthScreen(),
          ),
          GoRoute(
            path: 'home',
            builder: (ctx, state) => const TabsScreen(),
          ),
        ],
      ),
    ],
  ),
);
