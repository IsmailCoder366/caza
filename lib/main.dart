import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/app_theme.dart';
import 'logic/auth/auth_bloc.dart';
import 'logic/auth/auth_wrapper.dart';
import 'logic/auth/theme/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => AuthBloc()), // Initialize Auth here
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, currentMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getTheme(false),
            darkTheme: AppTheme.getTheme(true),
            themeMode: currentMode,

            // The AuthWrapper now handles the logic!
            home: const AuthWrapper(),
          );
        },
      ),
    );
  }
}