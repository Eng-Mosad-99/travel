import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/constnts.dart';
import 'package:travel/core/functiion/custom_toast.dart';
import 'package:travel/features/auth/data/auth_cubit/cubit/auth_cubit.dart';
import 'package:travel/features/auth/data/auth_cubit/cubit/auth_state.dart';
import '../../../../core/functiion/custom_navigate.dart';
import '../../../../core/functiion/custom_sized_box.dart';
import '../../../on_boarding/presentation/widgets/custom_btn.dart';
import 'custom_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SingUpFailure) {
          customToast(message: state.errorMessage);
        } else if (state is SignUpSuccessful) {
          customToast(
              message: "Successfully,Check your email to verfiy your account");
          customReplacementNavigate(context, "/signIn");
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                hntText: 'mohammed mosad',
                onChanged: (name) {
                  authCubit.name = name;
                },
              ),
              customSizedBox(height: 24),
              CustomTextFormField(
                hntText: 'mohammedmosad@gmail.com',
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              customSizedBox(height: 24),
              CustomTextFormField(
                hntText: '**********',
                suffixIcon: const Icon(
                  Icons.visibility_off_outlined,
                ),
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              customSizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Password must be 8 character',
                  ),
                ),
              ),
              customSizedBox(height: 40),
              state is SignUpLoading
                  ? CircularProgressIndicator(color: kPrimaryColor)
                  : CustomButton(
                      onPressed: () async {
                        if (authCubit.signUpFormKey.currentState!.validate()) {
                          authCubit.signUpFormKey.currentState!.save();
                          await authCubit.signUpWithEmailAndPassword();
                        } else {
                          authCubit.autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      text: 'Sign Up',
                    ),
            ],
          ),
        );
      },
    );
  }
}
