// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      firstname: json['firstname'] as String,
      middlename: json['middlename'] as String,
      lastname: json['lastname'] as String,
      imageUrl: json['imageUrl'] as String?,
      email: json['email'] as String,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']) ??
          Gender.unknown,
      occupation:
          $enumDecodeNullable(_$OccupationEnumMap, json['occupation']) ??
              Occupation.unknown,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'middlename': instance.middlename,
      'lastname': instance.lastname,
      'imageUrl': instance.imageUrl,
      'email': instance.email,
      'gender': _$GenderEnumMap[instance.gender],
      'occupation': _$OccupationEnumMap[instance.occupation],
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};

const _$OccupationEnumMap = {
  Occupation.student: 'student',
  Occupation.universityFaculty: 'universityFaculty',
  Occupation.unknown: 'unknown',
};
