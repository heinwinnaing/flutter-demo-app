import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/provider/http/api_response.dart';
import 'dart:io' show Platform;

import '../../utils.dart';

class ApiClient {
  const ApiClient();
  final String baseUrl = 'https://407a350a-535a-48ef-ac8d-601fd605f280.mock.pstmn.io';

  Future<ApiResponse<T>> get<T extends Serializable>(
      String endPoint, String token,
      {T Function(Map<String, dynamic> json)? fromJson}) async {
    var data = ApiResponse<T>(code: -1, message: '');
    
    try {
      final client = http.Client();
      final http.Response response = await client
          .get(
            Uri.parse('$baseUrl/$endPoint'),
            headers: _getHeaders(endPoint, token),
          )
          .timeout(const Duration(seconds: 60));
      client.close();

      checkResponse(response);

      if (fromJson != null && response.body.isEmpty == false) {
        data = ApiResponse.fromResponse(
            json.decode(response.body), (d) => fromJson(d));
      }
    } catch (_) {
      data.code = -1;
      data.message = 'an error occurred.';
    }
    return data;
  }

  Future<ApiResponse<T>> post<T extends Serializable>(
      String endPoint, String token,
      {dynamic payload,
      T Function(Map<String, dynamic> json)? fromJson}) async {
    var data = ApiResponse<T>(code: -1, message: 'invalid');

    try {
      final client = http.Client();
      final http.Response response = await client
          .post(Uri.parse('$baseUrl/$endPoint'),
              headers: _getHeaders(endPoint, token), body: jsonEncode(payload))
          .timeout(const Duration(seconds: 60));
      client.close();

      checkResponse(response);

      if (fromJson != null && response.body.isEmpty == false) {
        data = ApiResponse.fromResponse(
            json.decode(response.body), (d) => fromJson(d));
      }
    } catch (err) {
      data.code = -1;
      data.message = 'an error occurred.';
    }
    return data;
  }

  Future<ApiResponse<T>> put<T extends Serializable>(
      String endPoint, String token,
      {dynamic payload,
      T Function(Map<String, dynamic> json)? fromJson}) async {
    var data = ApiResponse<T>(code: -1, message: '');

    try {
      final client = http.Client();
      final http.Response response = await client
          .put(Uri.parse('$baseUrl/$endPoint'),
              headers: _getHeaders(endPoint, token), body: jsonEncode(payload))
          .timeout(const Duration(seconds: 60));
      client.close();

      checkResponse(response);

      if (fromJson != null && response.body.isEmpty == false) {
        data = ApiResponse.fromResponse(
            json.decode(response.body), (d) => fromJson(d));
      }
    } catch (_) {
      data.code = -1;
      data.message = 'an error occurred.';
    }
    return data;
  }

  Future<ApiResponse<T>> delete<T extends Serializable>(
      String endPoint, String token,
      {dynamic payload,
      T Function(Map<String, dynamic> json)? fromJson}) async {
    var data = ApiResponse<T>(code: -1, message: '');

    try {
      final client = http.Client();
      final http.Response response = await client
          .delete(Uri.parse(endPoint),
              headers: _getHeaders(endPoint, token), body: jsonEncode(payload))
          .timeout(const Duration(seconds: 60));
      client.close();
      checkResponse(response);
      if (fromJson != null && response.body.isEmpty == false) {
        data = ApiResponse.fromResponse(
            json.decode(response.body), (d) => fromJson(d));
      }
    } catch (_) {
      data.code = -1;
      data.message = 'an error occurred.';
    }

    return data;
  }

  Map<String, String> _getHeaders(String url, String token) {
    final headers = {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json; charset=utf-8',
      'client-type': Platform.operatingSystem,
      'client-version': Platform.localeName,
      'accept-language': 'en',
      'Authorization': token.startsWith('Basic') ? token : 'Bearer $token',
    };
    return headers;
  }

  void checkResponse(http.Response response) {
    if (response.statusCode == 401 &&
        response.headers.containsKey('x-error-code') &&
        response.headers['x-error-code'] == '2010') {
      Get.dialog(
        AlertDialog(
          content: const Text('Session timout'),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => Get.offNamed(AppRoutes.requestOtp),
            ),
          ],
        ),
      );
    }
  }
}
