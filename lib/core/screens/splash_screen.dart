import 'package:lottie/lottie.dart';
import 'package:visual_notes/core/localization/app_localization.dart';
import 'package:visual_notes/core/screens/popup_page.dart';
import 'package:visual_notes/core/styles/app_images.dart';
import 'package:visual_notes/core/styles/font_styles.dart';
import 'package:visual_notes/core/styles/sizes.dart';
import 'package:visual_notes/core/viewmodels/splash_viewmodel.dart';
import 'package:visual_notes/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  final _logoFadeController = FadeInController();
  final _titleFadeController = FadeInController();

  @override
  void initState() {
    _logoFadeController.fadeIn();
    _titleFadeController.fadeIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.read(splashViewModel);

    return PopUpPage(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: Sizes.screenHeight,
            width: Sizes.screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.splash,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                  curve: Curves.easeIn,
                  controller: _logoFadeController,
                  child: Lottie.asset(
                    'assets/json/splash_animation.json',
                    width: Sizes.splashLogoSize,
                    height: Sizes.splashLogoSize,
                  ),
                ),
                SizedBox(
                  width: Sizes.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        curve: Curves.easeIn,
                        controller: _titleFadeController,
                        duration: const Duration(seconds: 1),
                        child: CustomText.h1(
                          context,
                          tr('appName'),
                          weight: FontStyles.fontWeightExtraBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _logoFadeController.dispose();
    _titleFadeController.dispose();
    super.dispose();
  }
}
