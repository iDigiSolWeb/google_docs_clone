import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'screens/document_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (route) => const MaterialPage(child: HomeScreen()),
  '/document/:id': (route) => MaterialPage(
        child: DocumentScreen(
          id: route.pathParameters['id'] ?? '',
        ),
      ),
});