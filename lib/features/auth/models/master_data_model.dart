import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/utils.dart';
part 'master_data_model.g.dart';

@JsonSerializable()
class MasterDataModel implements Serializable {
  String? privacy_policy;
  String? about_us;
  String? terms_of_user;
  String? contact_us;
  MasterDataModel(
      {this.privacy_policy,
      this.about_us,
      this.terms_of_user,
      this.contact_us});

  factory MasterDataModel.fromJson(Map<String, dynamic> json) =>
      _$MasterDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MasterDataModelToJson(this);
}
