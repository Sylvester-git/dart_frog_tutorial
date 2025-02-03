import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  const User({required this.email, required this.password});

  final String email;
  final String password;

// Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Method to convert User object to JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
