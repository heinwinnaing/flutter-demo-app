import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/forms/slivers/sliver_list.dart';
import 'package:mpoints_app/core/themes/app_color.dart';
import 'package:mpoints_app/features/shops/controllers/shop_controller.dart';
import 'package:mpoints_app/features/shops/models/promotion_paging_model.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  final shopController = Get.put(ShopController());
  bool isLoadingData = true;
  late PromotionPagingModel promotionData = PromotionPagingModel(
      pageSize: 10, totalPage: 0, currentPage: 1, dataList: []);

  @override
  void initState() {
    initialization();
    super.initState();
  }

  void initialization() async {
    final result = await shopController.getPromotionList(1, 10);
    setState(() {
      isLoadingData = false;
      promotionData = result;
    });
  }

  Future<void> _pullRefresh() async {
    final result = await shopController.getPromotionList(1, 10);
    setState(() {
      promotionData = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Promotions'),
        backgroundColor: AppColor.clrButton,
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: RefreshIndicator(
              onRefresh: _pullRefresh,
              child: CustomScrollView(
                slivers: [
                  AppSliverList.promotionSliverList(isLoadingData, promotionData.dataList ?? []),
                ],
              ))),
    );
  }
}
