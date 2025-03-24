import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/utils.dart';

import '../../profile/models/profile_model.dart';
import 'jwt_token_model.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel implements Serializable {
  ProfileModel? profile;
  JwtTokenModel? token;

  LoginResponseModel({this.profile, this.token});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
