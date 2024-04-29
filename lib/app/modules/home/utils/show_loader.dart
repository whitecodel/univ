import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoader() {
  showDialog(
    context: Get.context!,
    builder: (context) => Container(
      height: Get.height,
      width: Get.width,
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    ),
  );
}
