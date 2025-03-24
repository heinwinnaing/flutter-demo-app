import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/core/constants/images.dart';
import 'package:mpoints_app/core/themes/app_color.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/auth/controllers/auth_controller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.clrOnboardingBg,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.width - 50,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(16, 117, 105, 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(350)),
                      border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(16, 117, 105, 1))),
                  child: const Padding(
                    padding: EdgeInsets.all(50),
                    child: Image(
                      image: AssetImage(imgPeopleSpeaker),
                      width: 100,
                      height: 100,
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text('More shop and get more points',
                    textAlign: TextAlign.left,
                    style: AppFont.extraLarge(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Enjoy for shopping to get more points from M-Points.',
                textAlign: TextAlign.left,
                style: AppFont.large(),
              ),
              const SizedBox(
                height: 100,
              ),
              OutlinedButton(
                onPressed: () => Get.offNamed(AppRoutes.requestOtp),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: const Color.fromRGBO(90, 240, 214, 1),
                  //side: BorderSide(color: Color.fromRGBO(16, 117, 105, 1)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'GET STARTED',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
