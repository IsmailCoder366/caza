import 'package:caza/core/widgets/caza_button.dart';
import 'package:caza/core/widgets/caza_text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class LoginScreen extends
StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
              const Text("Account Information", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

               CazaTextField(controller: emailController, label: 'Input your email',),
               const SizedBox(height: 16),
               CazaTextField(controller: passwordController, label: 'Input your password'),

              TextButton(
                onPressed: () {},
                child: Text("Forgot your password?",
                    style: TextStyle(color: theme.brightness == Brightness.dark ? Colors.white : AppColors.primaryAccent)),
              ),

              SizedBox(height: 30),
              CazaButton(text: 'Login', onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}