import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/utils.dart';

part 'feedback_model.g.dart';
@JsonSerializable()
class FeedbackModel implements Serializable {
  String? message;
  FeedbackModel({this.message});

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);
}
