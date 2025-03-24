import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/images.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/auth/controllers/auth_controller.dart';

class OtpRequestScreen extends StatefulWidget {
  const OtpRequestScreen({super.key});

  @override
  State<OtpRequestScreen> createState() => _OtpRequestScreenState();
}

class _OtpRequestScreenState extends State<OtpRequestScreen> {
  final authController = Get.put(AuthController());

  @override
  void initState(){
    authController.phoneController.text = '1234567890';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Image(
                      image: AssetImage(imgPeopleComputer),
                      fit: BoxFit.fill,
                      height: 300,
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(19, 191, 170, 1),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Let\'s sign in',
                            textAlign: TextAlign.left,
                            style:
                                AppFont.extraLarge(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Welcome back!. You have been missed.',
                            textAlign: TextAlign.left,
                            style: AppFont.large(),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: authController.phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color.fromRGBO(16, 117, 105, 1),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(16, 117, 105, 1))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(16, 117, 105, 1))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                          onPressed: authController.requestOtp,
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(60),
                            backgroundColor:
                                const Color.fromRGBO(90, 240, 214, 1),
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
                ],
              ),
            )
          ],
        ));
  }
}
