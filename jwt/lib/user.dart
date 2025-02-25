// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// USER MODEL
class User {
  /// User constructor
  const User({
    required this.id,
    required this.name,
    required this.password,
  });

  /// Users unique id
  final String id;

  /// Users name
  final String name;

  /// Users password
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

}
