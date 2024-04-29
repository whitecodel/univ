import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'package:get/get.dart';
import 'package:univ/app/modules/home/controllers/onboarding_controller.dart';
import 'package:univ/app/modules/home/views/home_view.dart';
import 'package:univ/app/routes/app_pages.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                () => controller.currentIndex.value == 0
                    ? SizedBox(
                        height: 30,
                        child: GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 30,
                      ),
              ),
              SizedBox(
                height: Get.height - 150,
                child: PageView(
                  controller: controller.pageController,
                  children: [
                    pageOne(),
                    pageTwo(),
                  ],
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == 0
                            ? primaryColor
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == 1
                            ? primaryColor
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  onPressed: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: Obx(
                    () => Text(
                      controller.currentIndex.value == 1 ? 'Register' : 'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

pageOne() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        // color: Colors.red,
        height: Get.height - 320,
        width: Get.width,
        child: Center(
          child: Image.asset(
            'assets/images/slide_1.png',
          ),
        ),
      ),
      Text(
        'Onboarding Text 1',
        style: TextStyle(
          fontSize: 20,
          color: primaryColor,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        width: Get.width - 50,
        height: 60,
        child: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}

pageTwo() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        // color: Colors.red,
        height: Get.height - 320,
        width: Get.width,
        child: Center(
          child: Image.asset(
            'assets/images/slide_1.png',
          ),
        ),
      ),
      Text(
        'Onboarding Text 2',
        style: TextStyle(
          fontSize: 20,
          color: primaryColor,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        width: Get.width - 50,
        height: 60,
        child: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ],
  );
}

class Backup extends StatelessWidget {
  const Backup({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      pageBackgroundColor: Colors.white,
      headerBackgroundColor: Colors.white,
      finishButtonText: 'Register',
      onFinish: () {
        Get.offAllNamed(Routes.LOGIN);
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Colors.black,
      ),
      skipTextButton: Text('Skip', style: TextStyle(color: primaryColor)),
      skipFunctionOverride: () {
        Get.offAllNamed(Routes.LOGIN);
      },
      trailing: Text('Login', style: TextStyle(color: primaryColor)),
      trailingFunction: () {
        Get.offAllNamed(Routes.LOGIN);
      },
      background: [
        Container(
          // color: Colors.red,
          height: Get.height - 320,
          width: Get.width,
          child: Center(
            child: Image.asset(
              'assets/images/slide_1.png',
            ),
          ),
        ),
        Container(
          // color: Colors.red,
          height: Get.height - 320,
          width: Get.width,
          child: Center(
            child: Image.asset(
              'assets/images/slide_1.png',
            ),
          ),
        ),
      ],
      totalPage: 2,
      speed: 1.8,
      pageBodies: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Onboarding Text 1',
                style: TextStyle(
                  fontSize: 20,
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Onboarding Text 2',
                style: TextStyle(
                  fontSize: 20,
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
