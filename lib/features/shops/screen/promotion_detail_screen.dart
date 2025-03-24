import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/themes/app_color.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/shops/controllers/shop_controller.dart';
import 'package:mpoints_app/features/shops/models/promotion_model.dart';

class PromotionDetailScreen extends StatefulWidget {
  const PromotionDetailScreen(
      {super.key, required this.id, this.title, this.data});
  final String? id;
  final String? title;
  final PromotionModel? data;

  @override
  State<PromotionDetailScreen> createState() => _PromotionDetailScreenState();
}

class _PromotionDetailScreenState extends State<PromotionDetailScreen> {
  final shopController = Get.put(ShopController());
  late PromotionModel promotion;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Title'),
        backgroundColor: AppColor.clrButton,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              child: Image(image: NetworkImage(widget.data?.imageUrl ?? '')),
            ),
            const SizedBox(height: 20,),
            Text(widget.data?.description ?? '', style: AppFont.normal(),),
          ],
        )),
      ),
    );
  }
}
