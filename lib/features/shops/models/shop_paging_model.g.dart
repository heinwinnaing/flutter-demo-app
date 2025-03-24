// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_paging_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopPagingModel _$ShopPagingModelFromJson(Map<String, dynamic> json) =>
    ShopPagingModel(
      totalCount: json['totalCount'] as int?,
      totalPage: json['totalPage'] as int?,
      currentPage: json['currentPage'] as int?,
      pageSize: json['pageSize'] as int?,
      hasNextPage: json['hasNextPage'] as bool?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      dataList: (json['dataList'] as List<dynamic>?)
          ?.map((e) => ShopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShopPagingModelToJson(ShopPagingModel instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPage': instance.totalPage,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
      'dataList': instance.dataList,
    };
