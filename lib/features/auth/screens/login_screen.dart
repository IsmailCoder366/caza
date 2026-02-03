import 'package:caza/core/widgets/caza_button.dart';
import 'package:caza/core/widgets/caza_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../../logic/auth/auth_event.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text("Welcome back!", style: theme.textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text("We're excited to see you again!", style: theme.textTheme.bodyMedium),

              const SizedBox(height: 48),
              // Inside your Column in login_screen.dart
              const Text(
                  "Account Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
              ),
              const SizedBox(height: 16),

              CazaTextField(
                controller: emailController,
                hintText: 'Input your email',
              ),

              const SizedBox(height: 16),

              CazaTextField(
                controller: passwordController,
                hintText: 'Password',
                isPassword: true, // This enables the dots and the eye icon
              ),

              TextButton(
                onPressed: () {},
                child: Text("Forgot your password?",
                    style: TextStyle(color: theme.brightness == Brightness.dark ? Colors.white : AppColors.primaryAccent)),
              ),

              SizedBox(height: 30),
              CazaButton(
                text: "Sign In",
                onPressed: () {
                  print("Login button pressed!"); // Add this to check your console
                  context.read<AuthBloc>().add(
                    LoginRequested(
                      emailController.text,
                      passwordController.text,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}