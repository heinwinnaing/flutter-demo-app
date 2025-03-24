// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopModel _$ShopModelFromJson(Map<String, dynamic> json) => ShopModel(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      logoUrl: json['logoUrl'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      address: json['address'] as String?,
      postalCode: json['postalCode'] as String?,
      contents: json['contents'] as String?,
      banners: json['banners'] as String?,
      bannerUrls: (json['bannerUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ShopModelToJson(ShopModel instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'description': instance.description,
      'logo': instance.logo,
      'logoUrl': instance.logoUrl,
      'phone': instance.phone,
      'website': instance.website,
      'address': instance.address,
      'postalCode': instance.postalCode,
      'contents': instance.contents,
      'banners': instance.banners,
      'bannerUrls': instance.bannerUrls,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
