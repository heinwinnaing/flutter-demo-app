// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequestModel _$OtpRequestModelFromJson(Map<String, dynamic> json) =>
    OtpRequestModel(
      expiry: json['expiry'] == null
          ? null
          : DateTime.parse(json['expiry'] as String),
    );

Map<String, dynamic> _$OtpRequestModelToJson(OtpRequestModel instance) =>
    <String, dynamic>{
      'expiry': instance.expiry?.toIso8601String(),
    };
