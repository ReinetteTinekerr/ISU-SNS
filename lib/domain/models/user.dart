import 'package:university_chat_app/constants/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.firstname,
    required this.middlename,
    required this.lastname,
    this.imageUrl,
    required this.email,
    this.gender = Gender.unknown,
    this.occupation = Occupation.unknown,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  final String firstname;
  final String middlename;
  final String lastname;
  final String? imageUrl;
  final String email;
  final Gender gender;
  final Occupation? occupation;
}
