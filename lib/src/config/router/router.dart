import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager/src/features/add_sales/presentation/screens/add_sales_scrn.dart';
import 'package:stock_manager/src/features/home/presentation/screens/homescreen.dart';
part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  // final shellNavigatorKey = GlobalKey<NavigatorState>();
  final router = GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: 'add_sales',
            builder: (context, state) {
              return const AddSalesScreen();
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
