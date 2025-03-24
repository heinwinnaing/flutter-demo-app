// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as String?,
      accountNo: json['accountNo'] as String?,
      avator: json['avator'] as String?,
      avatorUrl: json['avatorUrl'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      countryCode: json['countryCode'] as int?,
      mobileNumber: json['mobileNumber'] as String?,
      address: json['address'] as String?,
      postalCode: json['postalCode'] as String?,
      availablePoints: json['availablePoints'] as int?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountNo': instance.accountNo,
      'avator': instance.avator,
      'avatorUrl': instance.avatorUrl,
      'name': instance.name,
      'email': instance.email,
      'countryCode': instance.countryCode,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address,
      'postalCode': instance.postalCode,
      'availablePoints': instance.availablePoints,
    };
