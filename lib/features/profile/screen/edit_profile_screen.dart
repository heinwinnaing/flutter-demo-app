import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/features/profile/controllers/profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final profileController = Get.put(ProfileController());

  @override
  void initState(){
    initialization();
    super.initState();
  }

  void initialization() async{
    final result = await profileController.getProfile();
    setState(() {
      profileController.nameController.text = result.name ?? '';
      profileController.phoneController.text = result.mobileNumber ?? '';
      profileController.emailController.text = result.email ?? '';
      profileController.addressController.text = result.address ?? '';
      profileController.postalCodeController.text = result.postalCode ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text(
          'Edit Profile'
        ),
        backgroundColor: const Color.fromRGBO(19, 191, 170, 1),
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                style: const TextStyle(fontFamily: 'Josefin Sans'),
                controller: profileController.nameController,
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
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.red))),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                style: const TextStyle(fontFamily: 'Josefin Sans'),
                //initialValue: profileController.phoneController.text,
                controller: profileController.phoneController,
                readOnly: true,
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
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.red))),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: profileController.emailController,
                style: const TextStyle(fontFamily: 'Josefin Sans'),
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
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.red))),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: profileController.addressController,
                style: const TextStyle(fontFamily: 'Josefin Sans'),
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
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.red))),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: profileController.postalCodeController,
                style: const TextStyle(fontFamily: 'Josefin Sans'),
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.pin_drop,
                      color: Color.fromRGBO(19, 191, 170, 1),
                    ),
                    hintText: 'Postalcode',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(19, 191, 170, 1))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.red))),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 100,
              ),
              OutlinedButton(
                onPressed: profileController.updateProfile,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: const Color.fromRGBO(19, 191, 170, 1),
                  //side: const BorderSide(width: 1, color: Color.fromRGBO(16, 117, 105, 1)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}