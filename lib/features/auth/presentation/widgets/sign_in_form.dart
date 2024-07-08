import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/constnts.dart';
import 'package:travel/core/functiion/custom_sized_box.dart';
import 'package:travel/core/functiion/custom_toast.dart';
import 'package:travel/features/auth/data/auth_cubit/cubit/auth_cubit.dart';
import 'package:travel/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:travel/features/on_boarding/presentation/widgets/custom_btn.dart';
import '../../../../core/functiion/custom_navigate.dart';
import '../../../../core/functiion/is_user_login.dart';
import '../../data/auth_cubit/cubit/auth_state.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessful) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, "/home")
              : customToast(message: 'Please Verify your email');
        } else if (state is SingInFailure) {
          customToast(message: state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: authCubit.signInFormKey,
            child: Column(
              children: [
                customSizedBox(height: 24),
                CustomTextFormField(
                  hntText: 'mohammedmosad@gmail.com',
                  onChanged: (email) {
                    authCubit.emailAddress = email;
                  },
                ),
                customSizedBox(height: 24),
                CustomTextFormField(
                  obscureText: authCubit.obscurePasswordTextValue,
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                  hntText: '**********',
                  suffixIcon: IconButton(
                    icon: Icon(
                      authCubit.obscurePasswordTextValue == false
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      authCubit.obscurePasswordText();
                    },
                  ),
                ),
                customSizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    customNavigate(context, '/forgetPassword');
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                customSizedBox(height: 40),
                state is SignInLoading
                    ? CircularProgressIndicator(
                        backgroundColor: kPrimaryColor,
                      )
                    : CustomButton(
                        onPressed: () async {
                          if (authCubit.signInFormKey.currentState!
                              .validate()) {
                            authCubit.signInFormKey.currentState!.save();
                            await authCubit.signInWithEmailAndPassword();
                            isUserLogin();
                          } else {
                            authCubit.autovalidateMode =
                                AutovalidateMode.always;
                          }
                        },
                        text: 'Sign In',
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
