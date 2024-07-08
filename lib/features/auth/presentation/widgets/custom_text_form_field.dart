// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hntText,
    this.color,
    this.suffixIcon,
    this.onChanged,
    this.obscureText,
  });
  final String hntText;
  final Color? color;
  Widget? suffixIcon;
  final bool? obscureText;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF7F7F9),
      ),
      child: TextFormField(
          obscureText: obscureText ?? false,
          onChanged: onChanged,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This Field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hntText,
            hintStyle: TextStyle(
              color: color ?? const Color(0xff7D848D),
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          )),
    );
  }
}
