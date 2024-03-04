import 'package:anis/features/home/home_page.dart';
import 'package:anis/features/products/products_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'products',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductsPage();
          },
        ),
      ],
    ),
  ],
);