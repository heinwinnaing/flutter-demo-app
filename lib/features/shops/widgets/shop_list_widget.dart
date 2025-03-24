import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mpoints_app/features/shops/models/shop_model.dart';
import 'package:mpoints_app/features/shops/screen/shop_detail_screen.dart';
import 'package:mpoints_app/utils.dart';

class ShopListWidget extends StatefulWidget {
  const ShopListWidget({super.key, required this.isLoading, this.data});
  final bool isLoading;
  final List<ShopModel>? data;

  @override
  State<ShopListWidget> createState() => _ShopListWidgetState();
}

class _ShopListWidgetState extends State<ShopListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      List<int> rowSkeletons = const [1];
      return Column(
        children: rowSkeletons
            .map((item) => Container(
                padding: const EdgeInsets.only(
                    top: 33, left: 0, right: 0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.staggeredDotsWave(
                      color: const Color(0xFF1A1A3F),
                      size: 33,
                    ),
                  ],
                )))
            .toList(),
      );
    } else {
      final shops = widget.data ?? [] as List<ShopModel>;
      return Column(
          children: shops
              .map((shop) => Container(
                    padding: const EdgeInsets.only(
                        top: 15, left: 0, right: 0, bottom: 15),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(198, 206, 235, 1)))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => {
                                    Get.to(ShopDetailScreen(
                                      id: shop.id ?? '',
                                      name: shop.name,
                                      data: shop,
                                    ))
                                  },
                                  child: Text(
                                    shop.name ?? '',
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child: Text(shop.address ?? '',
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(96, 100, 111, 1),
                                          fontSize: 16)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  Utils.textEmptyDisplay(shop.phone),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(96, 100, 111, 1),
                                      fontSize: 16),
                                )
                              ]),
                          Image.network(
                            shop.logoUrl ?? '',
                            height: 100,
                            width: 100,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white54),
                                  ),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Text(
                                  'ERROR',
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            },
                          )
                        ]),
                  ))
              .toList());
    }
  }
}
