import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/features/shops/models/promotion_model.dart';
import 'package:mpoints_app/utils.dart';

part 'promotion_paging_model.g.dart';

@JsonSerializable()
class PromotionPagingModel implements Serializable{
  int? totalCount;
  int? totalPage;
  int? currentPage;
  int? pageSize;
  bool? hasNextPage;
  bool? hasPreviousPage;
  List<PromotionModel>? dataList = [];

  PromotionPagingModel(
      {this.totalCount,
      this.totalPage,
      this.currentPage,
      this.pageSize,
      this.hasNextPage,
      this.hasPreviousPage,
      this.dataList});

  factory PromotionPagingModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionPagingModelFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionPagingModelToJson(this);
}
