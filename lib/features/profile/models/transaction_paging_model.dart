import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/features/profile/models/transaction_model.dart';
import 'package:mpoints_app/utils.dart';

part 'transaction_paging_model.g.dart';
@JsonSerializable()
class TransactionPagingModel implements Serializable{
  int? totalCount;
  int? totalPage;
  int? currentPage;
  int? pageSize;
  bool? hasNextPage;
  bool? hasPreviousPage;
  List<TransactionModel>? dataList = [];

  TransactionPagingModel(
      {this.totalCount,
      this.totalPage,
      this.currentPage,
      this.pageSize,
      this.hasNextPage,
      this.hasPreviousPage,
      this.dataList});

  factory TransactionPagingModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionPagingModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionPagingModelToJson(this);
}