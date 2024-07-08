import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomSocialCircleAvatar extends StatelessWidget {
  const CustomSocialCircleAvatar({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: SvgPicture.asset(image),
    );
  }
}
