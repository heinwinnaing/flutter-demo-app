import 'package:json_annotation/json_annotation.dart';

import '../../../utils.dart';
import 'shop_model.dart';
part 'promotion_model.g.dart';

@JsonSerializable()
class PromotionModel implements Serializable{
  String? id;
  String? title;
  String? description;
  String? image;
  String? imageUrl;
  DateTime? startDateTime;
  DateTime? endDateTime;
  ShopModel? shop;

  PromotionModel(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.imageUrl,
      this.startDateTime,
      this.endDateTime,
      this.shop});
  factory PromotionModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionModelFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionModelToJson(this);
}
