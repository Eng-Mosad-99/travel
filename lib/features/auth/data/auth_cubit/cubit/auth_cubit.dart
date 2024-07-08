import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? name;
  String? emailAddress;
  String? password;
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool? obscurePasswordTextValue = true;

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await verifyEmail();
      emit(SignUpSuccessful());
    } on FirebaseAuthException catch (e) {
      _signUpHandleException(e);
    } catch (e) {
      emit(SingUpFailure(e.toString()));
    }
  }

  void _signUpHandleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SingUpFailure('The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SingUpFailure('The account already exists for that email.'));
    } else if (e.code == 'invalid-email') {
      emit(SingUpFailure('The email is invalid.'));
    } else {
      emit(SingUpFailure(e.code));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccessful());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SingInFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SingInFailure('Wrong password provided for that user.'));
      } else {
        emit(SingInFailure('Check your Email and password!'));
      }
    } catch (e) {
      emit(
        SingInFailure(e.toString()),
      );
    }
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  resetPassword() async {
    try {
      emit(ResetPasswordLoading());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessful());
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }
}
