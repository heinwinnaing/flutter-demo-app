import 'package:json_annotation/json_annotation.dart';
import 'package:mpoints_app/features/profile/models/profile_model.dart';
import 'package:mpoints_app/features/profile/models/transaction_model.dart';
import 'package:mpoints_app/utils.dart';

import '../../shops/models/promotion_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel implements Serializable {
  ProfileModel? profile;
  List<PromotionModel>? promotions;
  List<TransactionModel>? pointTransactions;
  
  HomeModel({this.profile, this.promotions, this.pointTransactions});
  
  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
