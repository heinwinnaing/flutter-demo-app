import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/features/home/models/home_model.dart';
import 'package:mpoints_app/provider/http/status_code.dart';
import 'package:mpoints_app/provider/mpoints_provider.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();
  var provider = Get.put(MPointsProvider());

  Future<HomeModel> getHome() async {
    HomeModel data = HomeModel();
    final accessToken = await provider.localStorage.readStorage(LocalStorages.accessToken);
    final response = await provider.apiClient.get('v1/home', accessToken,
        fromJson: (json) => HomeModel.fromJson(json));
    if (response.code == StatusCodes.success.value) {
      data = response.data as HomeModel;
      var database = await provider.database.getDataBase();
      response.data?.promotions?.forEach((promotion) async {
        await database.insert(
                'bannerSliders',
                {
                  'id': promotion.id,
                  'title': promotion.title,
                  'description': promotion.description,
                  'image': promotion.image,
                  'imageUrl': promotion.imageUrl
                },
                conflictAlgorithm: ConflictAlgorithm.replace);
      });
    }
    return data;
  }
}
