import 'package:get/get.dart';

import 'package:univ/app/modules/home/controllers/login_controller.dart';
import 'package:univ/app/modules/home/controllers/onboarding_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
