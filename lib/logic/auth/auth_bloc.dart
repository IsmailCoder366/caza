import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../data/models/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        // SIMULATION: In a real app, you'd call your Firebase/API here.
        await Future.delayed(const Duration(seconds: 2));

        if (event.email == "creator@caza.com") {
          final mockCreator = UserModel(
            uid: "1",
            email: event.email,
            displayName: "Nicholas Hyde",
            role: "creator", // KEY ROLE
          );
          emit(Authenticated(mockCreator));
        } else {
          final mockUser = UserModel(
            uid: "2",
            email: event.email,
            displayName: "Standard User",
            role: "user", // KEY ROLE
          );
          emit(Authenticated(mockUser));
        }
      } catch (e) {
        emit(AuthError("Login Failed. Please check your credentials."));
      }
    });

    on<LogoutRequested>((event, emit) {
      emit(Unauthenticated());
    });
  }
}