abstract class AuthEvent {}

// When the user clicks the "Log In" button
class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  LoginRequested(this.email, this.password);
}

// When the app starts, we check if a user is already logged in
class AppStarted extends AuthEvent {}

// When the user clicks "Log Out"
class LogoutRequested extends AuthEvent {}