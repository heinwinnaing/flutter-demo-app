import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mpoints_app/features/shops/models/promotion_model.dart';
import 'package:mpoints_app/features/shops/screen/promotion_detail_screen.dart';
import 'package:mpoints_app/utils.dart';

class PromotionListWidget extends StatefulWidget {
  const PromotionListWidget(
      {super.key, required this.isLoading, this.data, this.onRefresh});
  final bool isLoading;
  final List<PromotionModel>? data;
  final Function? onRefresh;

  @override
  State<PromotionListWidget> createState() => _PromotionListWidgetState();
}

class _PromotionListWidgetState extends State<PromotionListWidget> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LoadingAnimationWidget.staggeredDotsWave(
                        color: const Color(0xFF1A1A3F),
                        size: 33,
                      ),
                    ],
                  )))
              .toList());
    } else {
      List<PromotionModel> promotions = widget.data as List<PromotionModel>;
      return ListView.builder(
          itemCount: promotions.length,
          itemBuilder: (context, index) {
            return Container(
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
                                Get.to(() => PromotionDetailScreen(
                                    id: promotions[index].id ?? '',
                                    title: promotions[index].title ?? '',
                                    data: promotions[index]))
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
            );
          });
    }
  }
}
