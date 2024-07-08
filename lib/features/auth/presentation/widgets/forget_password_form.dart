import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/constnts.dart';
import 'package:travel/core/functiion/custom_navigate.dart';
import 'package:travel/core/functiion/custom_sized_box.dart';
import 'package:travel/core/functiion/custom_toast.dart';
import 'package:travel/features/auth/data/auth_cubit/cubit/auth_cubit.dart';
import 'package:travel/features/auth/data/auth_cubit/cubit/auth_state.dart';
import 'package:travel/features/on_boarding/presentation/widgets/custom_btn.dart';

import 'custom_text_form_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessful) {
          customToast(message: "Check Your Email To Reset Your Password");
          customReplacementNavigate(context, '/signIn');
        } else if (state is ResetPasswordFailure) {
          customToast(message: state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.forgetPasswordFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                hntText: 'moahmed@gmail.com',
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              customSizedBox(height: 40),
              state is ResetPasswordLoading
                  ? CircularProgressIndicator(backgroundColor: kPrimaryColor)
                  : CustomButton(
                      text: 'Forgot password',
                      onPressed: () async {
                        if (authCubit.forgetPasswordFormKey.currentState!
                            .validate()) {
                          await authCubit.resetPassword();
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
