import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/profile/controllers/profile_controller.dart';
import 'package:mpoints_app/features/profile/models/profile_model.dart';
import 'package:mpoints_app/features/profile/screen/edit_profile_screen.dart';
import 'package:mpoints_app/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());
  late ProfileModel? profile = ProfileModel();
  bool isLoading = true;
  @override
  void initState() {
    EasyLoading.show(status: 'Loading...');
    super.initState();
    initialization();
  }

  void initialization() async {
    final result = await profileController.getProfile();
    setState(() {
      isLoading = false;
      profile = result;
    });
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 50, left: 15, right: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(231, 242, 252, 1)),
                        color: const Color.fromRGBO(231, 242, 252, 1)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.credit_card,
                          color: Color.fromRGBO(19, 191, 170, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Card Informations'.toUpperCase(),
                          style: AppFont.normal(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Points:'.toUpperCase(),
                            style: AppFont.normal(),
                          ),
                          Text(
                            Utils.numberDisplay(profile?.availablePoints ?? 0),
                            style: AppFont.normal(
                                color: const Color.fromRGBO(19, 191, 170, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'User ID:'.toUpperCase(),
                            style: AppFont.normal(),
                          ),
                          Text(
                            Utils.cardNumberDisplay(
                                profile?.accountNo ?? '0000 0000 0000 0000'),
                            style: AppFont.normal(
                                color: const Color.fromRGBO(19, 191, 170, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(231, 242, 252, 1)),
                        color: const Color.fromRGBO(231, 242, 252, 1)),
                    child: InkWell(
                        onTap: () => {Get.to(() => const EditProfileScreen())},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              const Icon(
                                Icons.person,
                                color: Color.fromRGBO(19, 191, 170, 1),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Personal Informations'.toUpperCase(),
                                style:
                                    AppFont.normal(fontWeight: FontWeight.bold),
                              ),
                            ]),
                            const Icon(
                              Icons.edit,
                              color: Color.fromRGBO(19, 191, 170, 1),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Color.fromRGBO(19, 191, 170, 1),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            profile?.name ?? '-',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(96, 100, 111, 1)),
                          ),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.email,
                            color: Color.fromRGBO(19, 191, 170, 1),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(profile?.email ?? '-',
                              style: AppFont.normal(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromRGBO(96, 100, 111, 1))),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Color.fromRGBO(19, 191, 170, 1),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(+00) ${profile?.mobileNumber ?? '-'}',
                            style: AppFont.normal(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(96, 100, 111, 1)),
                          ),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.map,
                            color: Color.fromRGBO(19, 191, 170, 1),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            profile?.address ?? '#',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(96, 100, 111, 1)),
                          ),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.qr_code,
                            color: Color.fromRGBO(19, 191, 170, 1),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: Container(
                                    height: 300,
                                    padding: const EdgeInsets.only(
                                        top: 0, left: 0, right: 0, bottom: 0),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Place barcode scanner inside the frame',
                                          textAlign: TextAlign.center,
                                          style: AppFont.large(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 15,
                                              left: 25,
                                              right: 25,
                                              bottom: 15),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2.5,
                                                  color: const Color.fromRGBO(
                                                      16, 117, 105, 1))),
                                          child: BarcodeWidget(
                                            barcode: Barcode.code128(),
                                            drawText: false,
                                            data: profile?.accountNo ?? 'err',
                                            backgroundColor: Colors.white, // C
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              profile?.name ?? 'NAME ON CARD',
                                              style: AppFont.small(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              Utils.cardNumberDisplay(
                                                  profile?.accountNo ??
                                                      '0000 0000 0000 0000'),
                                              style: AppFont.small(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            ),
                            child: const Text(
                            'Barcode scan',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(96, 100, 111, 1)),
                          ),
                          ),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.history,
                            color: Color.fromRGBO(19, 191, 170, 1),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () =>
                                {Get.toNamed(AppRoutes.transactionHistory)},
                            child: const Text(
                              'Transactions history',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(96, 100, 111, 1)),
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  OutlinedButton(
                    onPressed: profileController.logOut,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(60),
                      backgroundColor: const Color.fromRGBO(19, 191, 170, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'LOG OUT',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
