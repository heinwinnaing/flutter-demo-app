import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/features/shops/models/promotion_model.dart';
import 'package:mpoints_app/features/shops/models/shop_model.dart';
import 'package:mpoints_app/utils.dart';

class AppSliverList {
  static SliverList promotionSliverList(
      bool isLoading, List<PromotionModel> promotions) {
    if (isLoading) {
      return SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          padding:
              const EdgeInsets.only(top: 33, left: 0, right: 0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.staggeredDotsWave(
                color: const Color(0xFF1A1A3F),
                size: 33,
              ),
            ],
          ),
        ),
        childCount: 1,
      ));
    } else {
      return SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          alignment: Alignment.center,
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 10),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromRGBO(198, 206, 235, 1)))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 200,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => {
                              Get.toNamed(AppRoutes.promotionDetails,
                                  arguments: {
                                    'id': promotions[index].id ?? '',
                                    'title': promotions[index].title ?? '',
                                    'data': promotions[index]
                                  })
                            },
                            child: Text(
                              promotions[index].title ?? 'Title',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                              Utils.textEmptyDisplay(
                                  promotions[index].shop?.name),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Color.fromRGBO(96, 100, 111, 1),
                                  fontSize: 16)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${Utils.displayDate(promotions[index].startDateTime ?? DateTime.now(), 'dd MMM yyyy')} - ${Utils.displayDate(promotions[index].endDateTime ?? DateTime.now(), 'dd MMM yyyy')}'
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Color.fromRGBO(96, 100, 111, 1),
                                fontSize: 16),
                          )
                        ]),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      promotions[index].imageUrl ?? '',
                      height: 100.0,
                      width: 150.0,
                      fit: BoxFit.fill,
                    ),
                  )
                ]),
          ),
        ),
        childCount: promotions.length,
      ));
    }
  }

  static SliverList shopSliverList(bool isLoading, List<ShopModel> shops) {
    if (isLoading) {
      return SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          padding: const EdgeInsets.only(top: 33, left: 0, right: 0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.staggeredDotsWave(
                color: const Color(0xFF1A1A3F),
                size: 33,
              ),
            ],
          ),
        ),
        childCount: 1,
      ));
    } else {
      return SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          padding:
              const EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(198, 206, 235, 1)))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => {
                      Get.toNamed(AppRoutes.shopDetails, arguments: {
                        'id': shops[index].id ?? '',
                        'name': shops[index].name,
                        'data': shops[index],
                      })
                    },
                    child: Text(
                      shops[index].name ?? '',
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
                    width: MediaQuery.of(context).size.width - 200,
                    child: Text(shops[index].address ?? '',
                        maxLines: 2,
                        style: const TextStyle(
                            color: Color.fromRGBO(96, 100, 111, 1),
                            fontSize: 16)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    Utils.textEmptyDisplay(shops[index].phone),
                    style: const TextStyle(
                        color: Color.fromRGBO(96, 100, 111, 1), fontSize: 16),
                  )
                ]),
            Image(
              image: NetworkImage(shops[index].logoUrl ?? ''),
              height: 100,
              width: 100,
            )
          ]),
        ),
        childCount: shops.length,
      ));
    }
  }
}
