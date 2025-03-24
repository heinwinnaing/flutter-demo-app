// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtTokenModel _$JwtTokenModelFromJson(Map<String, dynamic> json) =>
    JwtTokenModel(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      biometricToken: json['biometricToken'] as String?,
      registerToken: json['registerToken'] as String?,
      accessExpiry: json['accessExpiry'] == null
          ? null
          : DateTime.parse(json['accessExpiry'] as String),
      refreshExpiry: json['refreshExpiry'] == null
          ? null
          : DateTime.parse(json['refreshExpiry'] as String),
      biometricExpiry: json['biometricExpiry'] == null
          ? null
          : DateTime.parse(json['biometricExpiry'] as String),
      registerExpiry: json['registerExpiry'] == null
          ? null
          : DateTime.parse(json['registerExpiry'] as String),
    );

Map<String, dynamic> _$JwtTokenModelToJson(JwtTokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'biometricToken': instance.biometricToken,
      'registerToken': instance.registerToken,
      'accessExpiry': instance.accessExpiry?.toIso8601String(),
      'refreshExpiry': instance.refreshExpiry?.toIso8601String(),
      'biometricExpiry': instance.biometricExpiry?.toIso8601String(),
      'registerExpiry': instance.registerExpiry?.toIso8601String(),
    };
