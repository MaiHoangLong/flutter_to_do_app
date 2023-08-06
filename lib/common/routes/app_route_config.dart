import 'package:bloc_auth/bloc/bloc/auth_bloc.dart';
import 'package:bloc_auth/common/routes/app_route_const.dart';
import 'package:bloc_auth/presentation/Dashboard/dashboard.dart';
import 'package:bloc_auth/presentation/SignIn/sign_in.dart';
import 'package:bloc_auth/presentation/SignUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          name: AppRouteConstants.signInRouteName,
          path: '/signin',
          pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const SignIn(),
              )),
      GoRoute(
          name: AppRouteConstants.dasboardRouteName,
          path: '/',
          pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const Dashboard(),
              )),
      GoRoute(
          name: AppRouteConstants.signUpRouteName,
          path: '/signup',
          pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const SignUp(),
              )),
    ],
    redirect: (context, state) {
      if (state is Authenticated) {
        return '/';
      }
    },
  );
}
