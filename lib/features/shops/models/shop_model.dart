import 'package:json_annotation/json_annotation.dart';

import '../../../utils.dart';
part 'shop_model.g.dart';

@JsonSerializable()
class ShopModel implements Serializable {
  String? id;
  String? uid;
  String? name;
  String? description;
  String? logo;
  String? logoUrl;
  String? phone;
  String? website;
  String? address;
  String? postalCode;
  String? contents;
  String? banners;
  List<String>? bannerUrls;
  DateTime? updatedAt;

  ShopModel(
      {this.id,
      this.uid,
      this.name,
      this.description,
      this.logo,
      this.logoUrl,
      this.phone,
      this.website,
      this.address,
      this.postalCode,
      this.contents,
      this.banners,
      this.bannerUrls,
      this.updatedAt});
  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShopModelToJson(this);
}
