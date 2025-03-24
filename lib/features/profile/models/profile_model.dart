import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/utils.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel implements Serializable{
  String? id;
  String? accountNo;
  String? avator;
  String? avatorUrl;
  String? name;
  String? email;
  int? countryCode;
  String? mobileNumber;
  String? address;
  String? postalCode;
  int? availablePoints;

  ProfileModel(
      {this.id,
      this.accountNo,
      this.avator,
      this.avatorUrl,
      this.name,
      this.email,
      this.countryCode,
      this.mobileNumber,
      this.address,
      this.postalCode,
      this.availablePoints});
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}