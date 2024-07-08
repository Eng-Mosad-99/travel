import 'package:flutter/material.dart';
import 'package:travel/core/functiion/custom_sized_box.dart';
import 'package:travel/features/auth/presentation/widgets/forget_password_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black.withOpacity(.05),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ),
                customSizedBox(height: 40),
                const Align(
                  child: Text(
                    'Forgot password',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1B1E28),
                    ),
                  ),
                ),
                customSizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Enter your email account to reset your password',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff7D848D),
                    ),
                  ),
                ),
                customSizedBox(height: 40),
                const ForgetPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
