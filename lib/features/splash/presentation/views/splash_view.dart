import 'package:flutter/material.dart';
import 'package:travel/constnts.dart';
import 'package:travel/core/database/cache_helper.dart';
import 'package:travel/core/services/service_locator.dart';

import '../../../../core/functiion/custom_navigate.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: 'IsOnBoardingVisited') ?? false;

    bool isLogin = getIt<CacheHelper>().getData(key: 'isLogin') ?? false;

    bool isLogout = getIt<CacheHelper>().getData(key: 'isLogOut') ?? false;

    if (isOnBoardingVisited == true) {
      isLogin == true
          ? isLogout == true
              ? delayedNavigate(context, '/signIn')
              : delayedNavigate(context, '/home')
          : delayedNavigate(context, '/signIn');
    } else {
      delayedNavigate(context, '/onBoarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: const Center(
        child: Text(
          'Travenor',
          style: TextStyle(
            fontSize: 34,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

void delayedNavigate(context, String path) {
  Future.delayed(const Duration(seconds: 2)).then((value) {
    customReplacementNavigate(context, path);
  });
}
