import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/features/shops/models/shop_model.dart';
import 'package:mpoints_app/utils.dart';
part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel implements Serializable {
  String? id;
  String? transactionType;
  int? totalPoints;
  DateTime? transactionDate;
  String? description;
  ShopModel? shop;

  TransactionModel(
      {this.id,
      this.transactionType,
      this.totalPoints,
      this.transactionDate,
      this.description,
      this.shop});
  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
