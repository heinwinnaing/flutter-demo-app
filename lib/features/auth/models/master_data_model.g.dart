// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterDataModel _$MasterDataModelFromJson(Map<String, dynamic> json) =>
    MasterDataModel(
      privacy_policy: json['privacy_policy'] as String?,
      about_us: json['about_us'] as String?,
      terms_of_user: json['terms_of_user'] as String?,
      contact_us: json['contact_us'] as String?,
    );

Map<String, dynamic> _$MasterDataModelToJson(MasterDataModel instance) =>
    <String, dynamic>{
      'privacy_policy': instance.privacy_policy,
      'about_us': instance.about_us,
      'terms_of_user': instance.terms_of_user,
      'contact_us': instance.contact_us,
    };
