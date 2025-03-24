import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/images.dart';
import 'package:mpoints_app/core/themes/app_color.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/settings/controllers/setting_controller.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: AppColor.clrButton,
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.width - 100,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: AppColor.clrButtonLight,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(350)),
                      border:
                          Border.all(width: 2, color: AppColor.clrButtonLight),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(50),
                      child: Image(
                        image: AssetImage(imgPeopleFeedback),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Give Feedback',
                      style: AppFont.large(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    maxLines: 5,
                    maxLength: 250,
                    controller: settingController.feedbackController,
                    decoration: const InputDecoration(
                        hintText: 'Tell us on how can we improve...',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(16, 117, 105, 1))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(16, 117, 105, 1))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  OutlinedButton(
                    onPressed: settingController.feedBack,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(60),
                      backgroundColor: const Color.fromRGBO(16, 117, 105, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Submit'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              )
            ],
          )),
    );
  }
}
