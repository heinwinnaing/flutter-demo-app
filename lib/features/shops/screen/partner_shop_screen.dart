import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/forms/slivers/sliver_list.dart';
import 'package:mpoints_app/core/themes/app_color.dart';
import 'package:mpoints_app/features/shops/controllers/shop_controller.dart';
import 'package:mpoints_app/features/shops/models/shop_paging_model.dart';

class PartnerShopScreen extends StatefulWidget {
  const PartnerShopScreen({super.key});

  @override
  State<PartnerShopScreen> createState() => _PartnerShopScreenState();
}

class _PartnerShopScreenState extends State<PartnerShopScreen> {
  final shopController = Get.put(ShopController());
  bool isLoading = true;
  late ShopPagingModel shop =
      ShopPagingModel(pageSize: 10, totalPage: 0, currentPage: 1, dataList: []);

  @override
  void initState() {
    super.initState();
    initilization();
  }

  void initilization() async {
    final resultShop = await shopController.getShops();
    setState(() {
      isLoading = false;
      shop = resultShop;
    });
  }

  Future<void> _pullRefresh() async {
    final resultShop = await shopController.getShops();
    setState(() {
      shop = resultShop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partner Shops'),
        backgroundColor: AppColor.clrButton,
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: RefreshIndicator(
            onRefresh: _pullRefresh,
            child: CustomScrollView(
              slivers: [
                AppSliverList.shopSliverList(isLoading, shop.dataList ?? [])
              ],
            ),
          )),
    );
  }
}
