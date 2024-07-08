import 'package:flutter/material.dart';
import 'package:travel/core/functiion/custom_navigate.dart';
import 'package:travel/features/auth/presentation/widgets/custom_social_icons.dart';
import 'package:travel/features/auth/presentation/widgets/sign_up_form.dart';
import '../../../../constnts.dart';
import '../../../../core/functiion/custom_sized_box.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: customSizedBox(height: 92)),
            const SliverToBoxAdapter(
              child: Align(
                child: Text(
                  'Sign Up Now',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: customSizedBox(height: 12)),
            const SliverToBoxAdapter(
              child: Align(
                child: Text(
                  'Please fill the details and create account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff7D848D),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: customSizedBox(height: 40),
            ),
            const SliverToBoxAdapter(
              child: SignUpForm(),
            ),
            SliverToBoxAdapter(
              child: customSizedBox(height: 40),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account',
                    style: TextStyle(
                      color: Color(0xff707B81),
                      fontSize: 14,
                    ),
                  ),
                  customSizedBox(width: 8.0),
                  GestureDetector(
                    onTap: () {
                      customReplacementNavigate(context, '/signIn');
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: customSizedBox(height: 20),
            ),
            const SliverToBoxAdapter(
              child: Align(
                child: Text(
                  'Or Connect',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff707B81),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: customSizedBox(height: 36),
            ),
            const SliverToBoxAdapter(
              child: CustomSocialIcons(),
            ),
            SliverToBoxAdapter(
              child: customSizedBox(height: 32),
            ),
          ],
        ),
      ),
    );
  }
}
