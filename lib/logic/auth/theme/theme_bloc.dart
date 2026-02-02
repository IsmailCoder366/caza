import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Event
abstract class ThemeEvent {}
class ToggleTheme extends ThemeEvent {}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.dark) { // Start with Caza Dark
    on<ToggleTheme>((event, emit) {
      emit(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
    });
  }
}