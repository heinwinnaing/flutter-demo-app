import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/home/controllers/home_controller.dart';
import 'package:mpoints_app/features/home/models/home_model.dart';
import 'package:mpoints_app/features/profile/widgets/member_card_widget.dart';
import 'package:mpoints_app/features/profile/widgets/transaction_list_widget.dart';
import 'package:mpoints_app/features/shops/widgets/promotion_slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  bool isLoadingData = true;
  HomeModel? homeData;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    final result = await homeController.getHome();
    setState(() {
      isLoadingData = false;
      homeData = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 15),
          child: Column(
            children: [
              MemberCardWidget(
                isLoading: isLoadingData,
                fullName: homeData?.profile?.name ?? '',
                accountNumber: homeData?.profile?.accountNo ?? '',
                totalPoints: homeData?.profile?.availablePoints ?? 0,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Promotions',
                    style: AppFont.large(fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.promotionList),
                    child: Text(
                      'See all',
                      style: AppFont.normal(color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              PromotionSliderWidget(
                  isLoading: isLoadingData, data: homeData?.promotions ?? []),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    const Icon(
                      Icons.history,
                      color: Color.fromRGBO(16, 117, 105, 1),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Transactions history',
                        style: AppFont.normal(
                          color: const Color.fromRGBO(96, 100, 111, 1),
                        )),
                  ]),
                  InkWell(
                    onTap: () => {Get.toNamed(AppRoutes.transactionHistory)},
                    child: Text(
                      'See all',
                      style: AppFont.normal(color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TransactionListWidget(
                  isLoading: isLoadingData,
                  data: homeData?.pointTransactions ?? [])
            ],
          ),
        ),
      ),
    );
  }
}
