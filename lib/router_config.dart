import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_practice/main.dart';
import 'package:navigation_practice/screens/app_builder/app_builder.dart';
import 'package:navigation_practice/screens/app_builder/navigation_menu.dart';
import 'package:navigation_practice/screens/app_builder/storyboard.dart';
import 'package:navigation_practice/screens/app_builder/ui_builder.dart';
import 'package:navigation_practice/screens/dashboard/dashboard.dart';
import 'package:navigation_practice/screens/dashboard/marketplace.dart';
import 'package:navigation_practice/screens/dashboard/organisation.dart';

GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> shellNavigatorkey = GlobalKey<NavigatorState>();

class AppConfig {
  GoRouter router = GoRouter(
      navigatorKey: navigatorkey,
      initialLocation: '/dashboard',
      routes: [
        ShellRoute(
            navigatorKey: shellNavigatorkey,
            builder: (context, state, child) {
              return MyHomePage(
                child: child,
              );
            },
            routes: [
              GoRoute(
                  name: 'dashboard',
                  path: '/dashboard',
                  builder: (context, state) {
                    return DashBoard();
                  },
                  routes: [
                    GoRoute(
                      name: 'market_place',
                      path: 'market_place',
                      builder: (context, state) {
                        return MarketPlace();
                      },
                    ),
                    GoRoute(
                      name: 'organisation',
                      path: 'organisation',
                      builder: (context, state) {
                        return Organisation();
                      },
                    )
                  ]),
              GoRoute(
                  name: 'app_builder',
                  path: '/app_builder',
                  builder: (context, state) {
                    return AppBuilder();
                  },
                  routes: [
                    GoRoute(
                        name: 'navigation_menu',
                        path: 'navigation_menu',
                        builder: (context, state) {
                          return Navigation_Menu();
                        },
                        routes: [
                          GoRoute(
                            name: 'ui_builder',
                            path: 'ui_builder',
                            builder: (context, state) {
                              return UIBuilder();
                            },
                          ),
                          GoRoute(
                            name: 'story_board',
                            path: 'story_board',
                            builder: (context, state) {
                              return StoryBoard();
                            },
                          )
                        ]),
                  ]),
            ]),
      ],
      redirect: (context, state) {
        if (state.location == '/') {
          return '/dashboard';
        }
      },
      errorPageBuilder: (context, state) {
        return MaterialPage(
            child: Scaffold(
                body: Center(
                    child: Text(
          'Error 404\n page not found\n\n${state.location}',
          textAlign: TextAlign.center,
        ))));
      });
}
