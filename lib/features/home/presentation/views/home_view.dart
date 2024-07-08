import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel/core/database/cache_helper.dart';
import 'package:travel/core/functiion/custom_navigate.dart';
import 'package:travel/core/services/service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            getIt<CacheHelper>().saveData(key: 'isLogOut', value: true);
            customReplacementNavigate(context, '/signIn');
          },
          icon: const Icon(
            Icons.exit_to_app,
          ),
        ),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
