import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/images.dart';

import '../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    authController.initializeSetup();
  }

  @override
  Widget build(BuildContext context) {    
    return const Scaffold(
      backgroundColor: Color.fromRGBO(19, 191, 170, 1),
      body: Stack(children: [
        Center(
          child: Image(
            image: AssetImage(imgLogoWhite),
            width: 150,
            height: 150,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
