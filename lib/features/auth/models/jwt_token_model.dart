import 'package:json_annotation/json_annotation.dart';

import '../../../utils.dart';

part 'jwt_token_model.g.dart';

@JsonSerializable()
class JwtTokenModel implements Serializable {
  String? accessToken;
  String? refreshToken;
  String? biometricToken;
  String? registerToken;

  DateTime? accessExpiry;
  DateTime? refreshExpiry;
  DateTime? biometricExpiry;
  DateTime? registerExpiry;

  JwtTokenModel(
      {this.accessToken,
      this.refreshToken,
      this.biometricToken,
      this.registerToken,
      this.accessExpiry,
      this.refreshExpiry,
      this.biometricExpiry,
      this.registerExpiry});
  factory JwtTokenModel.fromJson(Map<String, dynamic> json) =>
      _$JwtTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$JwtTokenModelToJson(this);
}
