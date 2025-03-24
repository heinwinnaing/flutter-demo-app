import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/utils.dart';

part 'otp_request_model.g.dart';

@JsonSerializable()
class OtpRequestModel implements Serializable{
  DateTime? expiry;

  OtpRequestModel({this.expiry});
  factory OtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$OtpRequestModelToJson(this);
}