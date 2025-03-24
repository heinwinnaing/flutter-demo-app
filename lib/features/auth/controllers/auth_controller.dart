import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/features/auth/models/login_response_model.dart';
import 'package:mpoints_app/provider/http/status_code.dart';
import 'package:mpoints_app/provider/mpoints_provider.dart';

class AuthController extends GetxController {
  static AuthController get find => Get.find();
  var provider = Get.put(MPointsProvider());

  late final TextEditingController phoneController =
      TextEditingController(text: '');
  late final TextEditingController otpController =
      TextEditingController(text: '');
  late final TextEditingController nameController =
      TextEditingController(text: '');
  late final TextEditingController emailController =
      TextEditingController(text: '');
  late final TextEditingController addressController =
      TextEditingController(text: '');
  late final TextEditingController postalCodeController =
      TextEditingController(text: '');

  Future initializeSetup() async {
    //await provider.getMasterData();
    bool successRefreshToken = await refreshToken();

    final showWelcome =
        await provider.localStorage.readStorage(LocalStorages.showWelcome);
    if (successRefreshToken) {
      Get.offAllNamed(AppRoutes.home);
    } else if (showWelcome != 'false') {
      Get.offAllNamed(AppRoutes.welcome);
    } else {
      Get.offAllNamed(AppRoutes.requestOtp);
    }
  }

  Future requestOtp() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false, maskType: EasyLoadingMaskType.black);
    try {
      final response = await provider.apiClient.post(
          'v1/auth/otp-request', provider.basicAuth,
          payload: {'type': 'login', 'mobileNumber': phoneController.text},
          fromJson: (json) => LoginResponseModel.fromJson(json));
      if (response.code == StatusCodes.success.value) {
        Get.toNamed(AppRoutes.verifyOtp,
            arguments: {'phoneNumber': phoneController.text});
      } else {
        Get.dialog(
          AlertDialog(
            content: Text(response.code == StatusCodes.success.value
                ? 'Success'
                : 'Sorry, Please try again later.'),
            actions: [
              TextButton(
                child: const Text("Close"),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        );
      }
    } catch (_) {
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future resendOtp() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false, maskType: EasyLoadingMaskType.black);
    try {
      final response = await provider.apiClient.post(
          'v1/auth/otp-request', provider.basicAuth,
          payload: {'type': 'login', 'mobileNumber': phoneController.text},
          fromJson: (json) => LoginResponseModel.fromJson(json));

      Get.dialog(
        AlertDialog(
          content: Text(response.code == StatusCodes.success.value
              ? 'Success'
              : 'Sorry, Please try again later.'),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      );
    } catch (_) {
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future verifyOtp(String phoneNumber) async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false, maskType: EasyLoadingMaskType.black);
    try {
      final response = await provider.apiClient.post(
          'v1/auth/otp-verify', provider.basicAuth,
          payload: {
            'type': 'login',
            'mobileNumber': phoneNumber,
            'otpCode': otpController.text
          },
          fromJson: (json) => LoginResponseModel.fromJson(json));

      if (response.code == StatusCodes.success.value) {
        await provider.localStorage.writeStorage(
            LocalStorages.accessToken, response.data?.token?.accessToken ?? '');
        await provider.localStorage.writeStorage(LocalStorages.refreshToken,
            response.data?.token?.refreshToken ?? '');
        await provider.localStorage.writeStorage(LocalStorages.registerToken,
            response.data?.token?.registerToken ?? '');
        await provider.localStorage.writeStorage(LocalStorages.biometricToken,
            response.data?.token?.biometricToken ?? '');
        Get.offAllNamed(AppRoutes.home);
      } else if (response.code == StatusCodes.register_required.value) {
        await provider.localStorage.writeStorage(LocalStorages.registerToken,
            response.data?.token?.registerToken ?? '');
        Get.offAllNamed(AppRoutes.register,
            arguments: {'phoneNumber': phoneNumber});
      } else {
        Get.dialog(
          AlertDialog(
            content: Text(response.message ?? 'error'),
            actions: [
              TextButton(
                child: const Text("Close"),
                onPressed: () => Get.back(),
              ),
            ],
          ),
        );
      }
    } catch (_) {
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future registerAccount() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false, maskType: EasyLoadingMaskType.black);
    try {
      final registerToken =
          await provider.localStorage.readStorage(LocalStorages.registerToken);
      final response =
          await provider.apiClient.post('v1/auth/register', registerToken,
              payload: {
                'name': nameController.text,
                'email': emailController.text,
                'address': addressController.text
              },
              fromJson: (json) => LoginResponseModel.fromJson(json));
      if (response.code == StatusCodes.success.value) {
        await provider.localStorage.writeStorage(
            LocalStorages.accessToken, response.data?.token?.accessToken ?? '');
        await provider.localStorage.writeStorage(LocalStorages.refreshToken,
            response.data?.token?.refreshToken ?? '');
        await provider.localStorage.writeStorage(LocalStorages.registerToken,
            response.data?.token?.registerToken ?? '');
        await provider.localStorage.writeStorage(LocalStorages.biometricToken,
            response.data?.token?.biometricToken ?? '');
        Get.offAllNamed(AppRoutes.home);
      }
      Get.dialog(
        AlertDialog(
          content: response.code == StatusCodes.success.value
              ? const Text('Successfully registered')
              : Text(response.message ?? 'error register'),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => response.code == StatusCodes.success.value
                  ? Get.offAllNamed(AppRoutes.home)
                  : Get.back(),
            ),
          ],
        ),
      );
    } catch (_) {
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future logOut() async {
    final token =
        await provider.localStorage.readStorage(LocalStorages.accessToken);
    final response = await provider.apiClient.post('v1/auth/logout', token,
        fromJson: (json) => LoginResponseModel.fromJson(json));
    if (response.code == StatusCodes.success.value) {

    }
    await provider.localStorage.deleteStorage(LocalStorages.accessToken);
    await provider.localStorage.deleteStorage(LocalStorages.refreshToken);
    await provider.localStorage.deleteStorage(LocalStorages.registerToken);
    await provider.localStorage.deleteStorage(LocalStorages.biometricToken);

    Get.offNamed(AppRoutes.requestOtp);
  }

  Future<bool> refreshToken() async {
    final token =
        await provider.localStorage.readStorage(LocalStorages.refreshToken);
    if (token.isEmpty == false) {
      final response = await provider.apiClient.post(
          'v1/auth/refresh-token', token,
          fromJson: (json) => LoginResponseModel.fromJson(json));
      if (response.code == StatusCodes.success.value) {
        await provider.localStorage.writeStorage(
            LocalStorages.accessToken, response.data?.token?.accessToken ?? '');
        await provider.localStorage.writeStorage(LocalStorages.refreshToken,
            response.data?.token?.refreshToken ?? '');
        await provider.localStorage.writeStorage(LocalStorages.registerToken,
            response.data?.token?.registerToken ?? '');
        await provider.localStorage.writeStorage(LocalStorages.biometricToken,
            response.data?.token?.biometricToken ?? '');
        return true;
      }
    }
    return false;
  }
}
