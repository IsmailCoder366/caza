// lib/data/models/user_model.dart
class UserModel {
  final String uid;
  final String email;
  final String displayName;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
  });

// We remove the 'role' field here because everyone starts as a standard user
}