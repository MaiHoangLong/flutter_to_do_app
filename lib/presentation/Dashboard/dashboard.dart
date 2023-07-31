import 'package:bloc_auth/bloc/bloc/auth_bloc.dart';
import 'package:bloc_auth/common/routes/app_route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          actions: [
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignOutRequested());
              },
              child: const Text('Log Out'),
            )
          ],
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              // Navigate to the sign in screen when the user Signs Out
              context.goNamed(AppRouteConstants.signInRouteName);
            }
          },
          child: Center(
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.task), label: 'Tasks'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.task_alt_rounded), label: 'Done'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.archive_outlined), label: 'Archive'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_circle_rounded),
                        label: 'Add Task'),
                  ]),
            ),
          ),
        ));
  }
}
