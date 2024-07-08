import 'package:flutter/material.dart';

import '../../../../core/functiion/custom_sized_box.dart';
import 'custom_social_circle_avatar.dart';

class CustomSocialIcons extends StatelessWidget {
  const CustomSocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSocialCircleAvatar(image: 'Assets/images/facebook.svg'),
        customSizedBox(width: 20),
        const CustomSocialCircleAvatar(image: 'Assets/images/instagram.svg'),
        customSizedBox(width: 20),
        const CustomSocialCircleAvatar(image: 'Assets/images/twitter.svg'),
      ],
    );
  }
}
