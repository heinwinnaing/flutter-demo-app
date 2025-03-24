import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/features/shops/models/shop_model.dart';
import 'package:mpoints_app/utils.dart';

part 'shop_paging_model.g.dart';

@JsonSerializable()
class ShopPagingModel implements Serializable {
  int? totalCount;
  int? totalPage;
  int? currentPage;
  int? pageSize;
  bool? hasNextPage;
  bool? hasPreviousPage;
  List<ShopModel>? dataList = [];

  ShopPagingModel(
      {this.totalCount,
      this.totalPage,
      this.currentPage,
      this.pageSize,
      this.hasNextPage,
      this.hasPreviousPage,
      this.dataList});

  factory ShopPagingModel.fromJson(Map<String, dynamic> json) =>
      _$ShopPagingModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShopPagingModelToJson(this);
}
