import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mpoints_app/features/shops/models/promotion_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PromotionSliderWidget extends StatefulWidget {
  const PromotionSliderWidget({super.key, required this.isLoading, this.data});
  final bool isLoading;
  final List<PromotionModel>? data;

  @override
  State<PromotionSliderWidget> createState() => _PromotionSliderWidgetState();
}

class _PromotionSliderWidgetState extends State<PromotionSliderWidget> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {}

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return const Skeletonizer(
        child: Skeleton.leaf(
          child: Card(
            child: ListTile(
              minTileHeight: 175,
              title: Text('loading...')
            ),
          ),
        ),
      );
    } else {
      final bannerImags = widget.data as List<PromotionModel>;

      return Container(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CarouselSlider(
            //items: imageSliders,
            items: bannerImags
                .map((promotion) => Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 5  horizontally
                              1.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        child: Stack(children: [
                          Image.network(
                            promotion.imageUrl ?? '',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
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
                          ),
                        ]),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              //height: 200,
              onPageChanged: (index, reason) => {
                setState(() {
                  _current = index;
                })
              },
            ),
            carouselController: _controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerImags.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: _current == entry.key ? 20 : 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.only(
                      top: 10, left: 2, right: 2, bottom: 0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          width: 1,
                          color: _current == entry.key
                              ? const Color.fromRGBO(245, 200, 76, 1)
                              : Colors.grey),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _current == entry.key
                          ? const Color.fromRGBO(245, 200, 76, 1)
                          : Colors.grey),
                ),
              );
            }).toList(),
          ),
        ]),
      );
    }
  }
}
