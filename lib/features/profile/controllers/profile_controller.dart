import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/features/profile/models/profile_model.dart';
import 'package:mpoints_app/features/profile/models/transaction_paging_model.dart';
import 'package:mpoints_app/provider/http/status_code.dart';
import 'package:mpoints_app/provider/mpoints_provider.dart';

class ProfileController extends GetxController {
  static ProfileController get find => Get.find();
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

  Future<ProfileModel> getProfile() async {
    ProfileModel data = ProfileModel();
    EasyLoading.show(status: 'Loading...', dismissOnTap: false, maskType: EasyLoadingMaskType.black);
    try {
      final accessToken =
          await provider.localStorage.readStorage(LocalStorages.accessToken);
      final response = await provider.apiClient.get('v1/profile', accessToken,
          fromJson: (json) => ProfileModel.fromJson(json));
      if (response.code == StatusCodes.success.value) {
        data = response.data as ProfileModel;
      }
    } catch (_) {
    } finally {
      EasyLoading.dismiss();
    }
    return data;
  }

  Future updateProfile() async {
    EasyLoading.show(status: 'Loading...', dismissOnTap: false, maskType: EasyLoadingMaskType.black);
    try {
      final accessToken =
          await provider.localStorage.readStorage(LocalStorages.accessToken);
      final response = await provider.apiClient.put('v1/profile', accessToken,
          payload: {
            'name': nameController.text,
            'email': emailController.text,
            'address': addressController.text,
            'postalCode': postalCodeController.text,
          },
          fromJson: (json) => ProfileModel.fromJson(json));

      Get.dialog(
        AlertDialog(
          content: Text(response.message ?? 'error'),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => response.code == StatusCodes.success.value
                  ? Get.offNamed(AppRoutes.profile)
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

  Future<TransactionPagingModel> getTransactions(int page, int size) async {
    TransactionPagingModel data = TransactionPagingModel(
        pageSize: 10, totalPage: 0, currentPage: 1, dataList: []);
    final accessToken =
        await provider.localStorage.readStorage(LocalStorages.accessToken);
    final response = await provider.apiClient.get(
        'v1/points/transactions', accessToken,
        fromJson: (json) => TransactionPagingModel.fromJson(json));
    if (response.code == StatusCodes.success.value) {
      data = response.data as TransactionPagingModel;
    }
    return data;
  }

  Future logOut() async {
    try {
      EasyLoading.show(status: 'Loading...', dismissOnTap: false, maskType: EasyLoadingMaskType.black);
      final accessToken =
          await provider.localStorage.readStorage(LocalStorages.accessToken);
      await provider.apiClient.post('v1/auth/logout', accessToken,
          fromJson: (json) => ProfileModel.fromJson(json));

      await provider.localStorage.deleteStorage(LocalStorages.accessToken);
      await provider.localStorage.deleteStorage(LocalStorages.refreshToken);
      await provider.localStorage.deleteStorage(LocalStorages.registerToken);
      await provider.localStorage.deleteStorage(LocalStorages.biometricToken);
    } catch (_) {
    } finally {
      EasyLoading.dismiss();
    }
    Get.offAllNamed(AppRoutes.requestOtp);
  }
}
