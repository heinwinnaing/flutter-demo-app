import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/features/auth/models/jwt_token_model.dart';
import 'package:mpoints_app/features/profile/models/profile_model.dart';
import 'package:mpoints_app/utils.dart';

part 'otp_verify_model.g.dart';

@JsonSerializable()
class OtpVerifyModel implements Serializable {
  ProfileModel? profile;
  JwtTokenModel? token;

  OtpVerifyModel({this.profile, this.token});
  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyModelFromJson(json);
  Map<String, dynamic> toJson() => _$OtpVerifyModelToJson(this);
}
