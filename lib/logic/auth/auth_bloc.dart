import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../data/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        // 1. Simulate Network Latency
        await Future.delayed(const Duration(seconds: 2));

        // 2. Logic: Safe Name Extraction
        // We check if the email contains '@' and is not empty.
        String extractedName = "User"; // Default fallback

        if (event.email.isNotEmpty && event.email.contains('@')) {
          extractedName = event.email.split('@')[0];
        }

        // Final guard: If splitting resulted in an empty string (e.g. "@domain.com")
        if (extractedName.isEmpty) {
          extractedName = "User";
        }

        final authenticatedUser = UserModel(
          uid: "user_123",
          email: event.email,
          displayName: extractedName,
        );

        emit(Authenticated(authenticatedUser));

      } catch (e) {
        emit(AuthError("Login Failed. Please check your credentials."));
      }
    });

    on<LogoutRequested>((event, emit) {
      emit(Unauthenticated());
    });
  }
}