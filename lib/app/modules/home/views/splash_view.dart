import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:univ/app/modules/home/utils/data_storage.dart';
import 'package:univ/app/modules/home/views/home_view.dart';
import 'package:univ/app/routes/app_pages.dart';

class SplashView extends GetView {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        String? token = DataStorage.retrieve('token');
        if (token != null) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.ONBOARDING);
        }
      },
    );
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'UNIV',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
