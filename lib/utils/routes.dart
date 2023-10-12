import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_clone/resources/auth_class.dart';
import 'package:zoom_clone/screens/home.dart';
import 'package:zoom_clone/screens/home_menu.dart';
import 'package:zoom_clone/screens/login_screen.dart';
import 'package:zoom_clone/utils/btn_loader.dart';

GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return StreamBuilder(
          stream: AuthMethod.userState,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const BtnLoader();
            }
            if (snapshot.hasData) {
              return const HomeMenu();
            }
            return const LoginScreen();
          },
        );
      },
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeMenu(),
    )
  ],
);
