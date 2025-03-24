import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/forms/webview/web_view_screen.dart';
import 'package:mpoints_app/features/settings/controllers/setting_controller.dart';
import 'package:mpoints_app/features/settings/screen/feedback_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final settingController = Get.put(SettingController());
  late final String aboutUs = '';
  late final String contactUs = '';
  late final String privacyPolicy = '';
  late final String termsUse = '';

  @override
  void initState() {
    //initialization();
    super.initState();
  }

  void initialization() async {
    final db = await settingController.provider.database.getDataBase();
    final masterData = await db.rawQuery('SELECT url FROM contentUrls');
    masterData.forEach((element) {
      print(element['url']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            padding:
                const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 15),
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
                          Icons.info,
                          color: const Color.fromRGBO(19, 191, 170, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'M-Points'.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () => {
                        Get.to(const WebViewScreen(
                            url: 'https://9b56571b-bfe7-4f88-acef-55c93eea01f7.mock.pstmn.io/v1/about_us',
                            title: 'About M-Points'))
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'About M-Points',
                              style: TextStyle(fontSize: 15),
                            ),
                            Icon(Icons.chevron_right)
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () => {
                        Get.to(const WebViewScreen(
                            url: 'https://point-api.docheck.link/v1/contact_us',
                            title: 'Contact Us'))
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Contact Us',
                              style: TextStyle(fontSize: 15),
                            ),
                            Icon(Icons.chevron_right)
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () => {
                        Get.to(const FeedbackScreen())
                      },
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Feedback',
                              style: TextStyle(fontSize: 15),
                            ),
                            Icon(Icons.chevron_right)
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                          Icons.info,
                          color: Color.fromRGBO(19, 191, 170, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Languages'.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'English',
                            style: TextStyle(fontSize: 15),
                          ),
                          Icon(Icons.check)
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Burmese',
                            style: TextStyle(fontSize: 15),
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'App Version 1.0.0',
                      textAlign: TextAlign.center,
                    ),
                  )
                ]),
          ),
        )
      ]),
    );
  }
}
