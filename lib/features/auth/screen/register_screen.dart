import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/features/auth/controllers/auth_controller.dart';

import '../../../core/themes/app_font.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.phoneNumber});
  final String? phoneNumber;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final authController = Get.put(AuthController());

  @override
  void initState() {
    authController.nameController.text = '';
    authController.addressController.text = '';
    authController.postalCodeController.text = '';
    super.initState();
    checkToken();
  }

  void checkToken() async {
    final registerToken = await authController.provider.localStorage
        .readStorage(LocalStorages.registerToken);
    if (registerToken.isEmpty) {
      Get.offAllNamed(AppRoutes.requestOtp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Profile',
          style: AppFont.large(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(19, 191, 170, 1),
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Let\'s register account',
                    textAlign: TextAlign.left,
                    style: AppFont.extraLarge(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enjoy for shopping with M-Points. Being to smarter way of shopping and get more points.',
                    textAlign: TextAlign.left,
                    style: AppFont.normal(),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: authController.nameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromRGBO(19, 191, 170, 1),
                      ),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(19, 191, 170, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(19, 191, 170, 1))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.red))),
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  readOnly: true,
                  initialValue: widget.phoneNumber,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color.fromRGBO(19, 191, 170, 1),
                      ),
                      hintText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(19, 191, 170, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(19, 191, 170, 1))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.red))),
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: authController.emailController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromRGBO(19, 191, 170, 1),
                      ),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(19, 191, 170, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(19, 191, 170, 1))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.red))),
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: authController.addressController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.map,
                        color: Color.fromRGBO(19, 191, 170, 1),
                      ),
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(19, 191, 170, 1))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(19, 191, 170, 1))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.red))),
                  onChanged: (String? value) {},
                ),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'By clicking register button you agree to our ',
                          style: AppFont.normal(
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                            text: 'terms and conditions ',
                            style: AppFont.normal(
                              color: const Color.fromARGB(255, 4, 50, 88),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushNamed('/request-otp')),
                        TextSpan(
                            text: 'privacy policy',
                            style: AppFont.normal(
                              color: const Color.fromARGB(255, 4, 50, 88),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushNamed('/request-otp'))
                      ])),
                ),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: authController.registerAccount,
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: const Color.fromRGBO(19, 191, 170, 1),
                    //side: const BorderSide(width: 1, color: Color.fromRGBO(16, 117, 105, 1)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'REGISTER NOW',
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
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: AppFont.normal(),
                        ),
                        TextSpan(
                            text: 'Login',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 4, 50, 88),
                                fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => Get.offAllNamed(AppRoutes.requestOtp))
                      ])),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
