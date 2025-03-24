import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/shops/controllers/shop_controller.dart';
import 'package:mpoints_app/features/shops/models/promotion_model.dart';
import 'package:mpoints_app/features/shops/models/shop_paging_model.dart';
import 'package:mpoints_app/features/shops/widgets/promotion_slider_widget.dart';
import 'package:mpoints_app/features/shops/widgets/shop_list_widget.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final shopController = Get.put(ShopController());
  bool isLoading = true;
  late List<PromotionModel> promotions = [];
  late ShopPagingModel shop =
      ShopPagingModel(pageSize: 10, totalPage: 0, currentPage: 1, dataList: []);

  @override
  void initState() {
    super.initState();
    initilization();
  }

  void initilization() async {
    final banners = await shopController.getPromotions();
    final resultShop = await shopController.getShops();
    setState(() {
      isLoading = false;
      promotions = banners;
      shop = resultShop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 15),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promotions',
                  style: AppFont.large(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => { Get.toNamed(AppRoutes.promotionList) },
                  child: Text('See all',
                      style: AppFont.normal(color: Colors.blue)),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            PromotionSliderWidget(
              isLoading: isLoading,
              data: promotions,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Partner Shops',
                  style: AppFont.large(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => { Get.toNamed(AppRoutes.partnerShop) },
                  child: Text('See all',
                      style: AppFont.normal(color: Colors.blue)),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            ShopListWidget(
              isLoading: isLoading,
              data: shop.dataList ?? [],
            ),
          ],
        )),
      ),
    );
  }
}
