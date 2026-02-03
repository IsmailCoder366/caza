import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'logic/auth/theme/theme_bloc.dart';
import 'features/auth/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Providing the ThemeBrain to the whole app
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, currentMode) {
          return MaterialApp(
            title: 'Caza Project',
            debugShowCheckedModeBanner: false,

            // Adjusted to use the new getTheme method from Step 2
            theme: AppTheme.getTheme(true), // Light Theme
            darkTheme: AppTheme.getTheme(false), // Dark Theme

            // This is controlled by your ThemeBloc toggle
            themeMode: currentMode,

            home: LoginScreen(),
          );
        },
      ),
    );
  }
}