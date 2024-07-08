// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:travel/core/functiion/custom_navigate.dart';
import 'package:travel/features/on_boarding/data/model/on_barding_model.dart';
import 'package:travel/features/on_boarding/presentation/widgets/custom_btn.dart';
import 'package:travel/features/on_boarding/presentation/widgets/custom_nav_bar_text.dart';
import '../../../../core/functiion/on_boarding_visited.dart';
import 'custom_controller.dart';

class PageViewBody extends StatefulWidget {
  const PageViewBody({
    super.key,
  });

  @override
  State<PageViewBody> createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {
  final PageController controller = PageController(initialPage: 0);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        onBoardingData[index].image,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                currentIndex == onBoardingData.length - 1
                    ? const CustomNavBar(
                        text: '',
                      )
                    : CustomNavBar(
                        onTap: () {
                          onBoardingVisited();
                          customReplacementNavigate(context, '/signIn');
                        },
                        text: 'Next',
                      ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              onBoardingData[index].textImage,
              width: 319,
              height: 157,
            ),
            const SizedBox(
              height: 23,
            ),
            CustomIndicator(controller: controller),
            const SizedBox(
              height: 45,
            ),
            currentIndex == 0
                ? CustomButton(
                    text: 'Get Started',
                    onPressed: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                  )
                : CustomButton(
                    text: 'Next',
                    onPressed: () {
                      currentIndex == onBoardingData.length - 1
                          ? customReplacementNavigate(context, '/signIn')
                          : controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                      onBoardingVisited();
                    },
                  ),
            const SizedBox(
              height: 6,
            ),
          ],
        );
      },
      itemCount: onBoardingData.length,
    );
  }
}
