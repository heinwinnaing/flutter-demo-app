import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/features/shops/models/promotion_model.dart';
import 'package:mpoints_app/features/shops/models/promotion_paging_model.dart';
import 'package:mpoints_app/features/shops/models/shop_paging_model.dart';
import 'package:mpoints_app/provider/http/status_code.dart';
import 'package:mpoints_app/provider/mpoints_provider.dart';

class ShopController extends GetxController {
  static ShopController get find => Get.find();
  var provider = Get.put(MPointsProvider());

  Future<List<PromotionModel>> getPromotions() async {
    var database = await provider.database.getDataBase();
    var promotions = await database.rawQuery('select * from bannerSliders');
    var banners =
        promotions.map((json) => PromotionModel.fromJson(json)).toList();
    return banners;
  }

  Future<ShopPagingModel> getShops() async {
    ShopPagingModel data = ShopPagingModel(
        pageSize: 10, totalPage: 0, currentPage: 1, dataList: []);
    final accessToken =
        await provider.localStorage.readStorage(LocalStorages.accessToken);
    final response = await provider.apiClient.get('v1/shops', accessToken,
        fromJson: (json) => ShopPagingModel.fromJson(json));
    if (response.code == StatusCodes.success.value) {
      data = response.data as ShopPagingModel;
    }
    return data;
  }

  Future<PromotionPagingModel> getPromotionList(int page, int size) async {
    PromotionPagingModel data = PromotionPagingModel();
    final accessToken =
        await provider.localStorage.readStorage(LocalStorages.accessToken);
    final response = await provider.apiClient.get('v1/promotions', accessToken,
        fromJson: (json) => PromotionPagingModel.fromJson(json));
    if (response.code == StatusCodes.success.value) {
      data = response.data as PromotionPagingModel;
    }
    return data;
  }
}
