import 'package:bloc_auth/bloc/bloc/auth_bloc.dart';
import 'package:bloc_auth/common/color/colors.dart';
import 'package:bloc_auth/common/routes/app_route_config.dart';
import 'package:bloc_auth/data/repositories/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp.router(
          theme: ThemeData(
              colorScheme: defaultColorScheme, primarySwatch: Colors.blue),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter().router,
        ),
      ),
    );
  }
}
