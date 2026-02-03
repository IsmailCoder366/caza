import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/creator_module/screens/creator_main_layout.dart';
import 'auth_bloc.dart';
import 'auth_state.dart';
import '../../features/auth/screens/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        // 1. If Authenticated, check roles to decide the Module
        if (state is Authenticated) {
          return const CreatorMainLayout();
        }

        // 2. If the app is checking for a session or is loading
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 3. Default: If not logged in, show the Login Screen
        return LoginScreen();
      },
    );
  }
}