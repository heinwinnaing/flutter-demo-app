import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/images.dart';
import 'package:mpoints_app/core/themes/app_font.dart';
import 'package:mpoints_app/features/auth/controllers/auth_controller.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key, required this.phoneNumber});
  final String? phoneNumber;

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final authController = Get.put(AuthController());

  @override
  void initState() {
    authController.otpController.text = '123123';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Verify OTP',
            style: AppFont.large(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(19, 191, 170, 1),
        ),
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
                      image: AssetImage(imgBirdEnvelop),
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
                            'Enter your verification code',
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
                            'Enter 6 digits OTP code that you received on ${widget.phoneNumber}.',
                            style: AppFont.normal(),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: authController.otpController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'OTP Code',
                              prefixIcon: Icon(
                                Icons.lock,
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
                          onPressed: () => authController
                              .verifyOtp(widget.phoneNumber ?? ''),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(60),
                            backgroundColor:
                                const Color.fromRGBO(90, 240, 214, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'VERIFIED',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Do not received any code? ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                                TextSpan(
                                    text: 'Resend Code',
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 4, 50, 88),
                                        fontSize: 16),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => authController.resendOtp())
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
