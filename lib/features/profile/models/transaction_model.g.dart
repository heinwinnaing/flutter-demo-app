// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: json['id'] as String?,
      transactionType: json['transactionType'] as String?,
      totalPoints: json['totalPoints'] as int?,
      transactionDate: json['transactionDate'] == null
          ? null
          : DateTime.parse(json['transactionDate'] as String),
      description: json['description'] as String?,
      shop: json['shop'] == null
          ? null
          : ShopModel.fromJson(json['shop'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionType': instance.transactionType,
      'totalPoints': instance.totalPoints,
      'transactionDate': instance.transactionDate?.toIso8601String(),
      'description': instance.description,
      'shop': instance.shop,
    };
