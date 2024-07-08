import 'package:flutter/material.dart';
import 'package:travel/constnts.dart';
import 'package:travel/core/functiion/custom_navigate.dart';
import '../../../../core/functiion/custom_sized_box.dart';
import '../widgets/custom_social_icons.dart';
import '../widgets/sign_in_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: customSizedBox(height: 92)),
          const SliverToBoxAdapter(
            child: Align(
              child: Text(
                'Sign In Now',
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
                'Please sign in to continue our app',
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
            child: SignInForm(),
          ),
          SliverToBoxAdapter(
            child: customSizedBox(height: 40),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account?',
                  style: TextStyle(
                    color: Color(0xff707B81),
                    fontSize: 14,
                  ),
                ),
                customSizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    customReplacementNavigate(context, '/signUp');
                  },
                  child: Text(
                    'Sign Up',
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
            child: customSizedBox(height: 100),
          ),
          const SliverToBoxAdapter(
            child: CustomSocialIcons(),
          ),
          SliverToBoxAdapter(
            child: customSizedBox(height: 32),
          ),
        ],
      ),
    );
  }
}
