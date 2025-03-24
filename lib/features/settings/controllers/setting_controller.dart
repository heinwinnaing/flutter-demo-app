import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/features/settings/models/feedback_model.dart';
import 'package:mpoints_app/provider/http/status_code.dart';
import 'package:mpoints_app/provider/mpoints_provider.dart';

class SettingController extends GetxController {
  final provider = Get.put(MPointsProvider());
  late final TextEditingController feedbackController =
      TextEditingController(text: '');

  Future feedBack() async {
    EasyLoading.show(status: 'Loading...');
    try {
      final accessToken =
          await provider.localStorage.readStorage(LocalStorages.accessToken);
      final response = await provider.apiClient.post(
          'v1/feedbacks', accessToken,
          payload: {'message': feedbackController.text},
          fromJson: (json) => FeedbackModel.fromJson(json));
      Get.dialog(
        AlertDialog(
          content: Text(response.code == StatusCodes.success.value
              ? 'Thanks for your feedbacks.'
              : 'failed'),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => response.code == StatusCodes.success.value
                  ? Get.offNamed(AppRoutes.setting)
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
}
