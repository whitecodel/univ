import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:univ/app/modules/home/utils/data_storage.dart';

import '../utils/show_loader.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    try {
      showLoader();
      loading.value = true;
      final response = await http.post(
        Uri.parse('https://univsportatech.com/api/login'),
        body: {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );
      if (response.statusCode == 200) {
        Get.offAllNamed('/home');
        Map<String, dynamic> data = jsonDecode(response.body);
        String? token = data['token'];
        DataStorage.store('token', token);
      } else {
        Get.snackbar(
          'Error',
          'Invalid email or password',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      loading.value = false;
      Get.back();
    }
  }
}
