import 'package:flutter/foundation.dart';

class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String? photoUrl;

  // THE KEY: This determines if they go to the User or Creator module
  final String role;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoUrl,
    required this.role,
  });

  // 1. The "Translator": Converts Database (JSON) data into a Dart Object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      photoUrl: map['photoUrl'],
      role: map['role'] ?? 'user', // Default to 'user' for safety
    );
  }

  // 2. The "Package": Converts Dart Object back to JSON to save to Database
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'role': role,
    };
  }

  // 3. The "Cloner": Useful for updating a profile without creating a whole new object
  UserModel copyWith({
    String? displayName,
    String? photoUrl,
    String? role,
  }) {
    return UserModel(
      uid: uid,
      email: email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
    );
  }
}