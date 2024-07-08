import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/core/services/service_locator.dart';
import 'package:travel/firebase_options.dart';
import 'package:travel/simple_bloc_observer.dart';

import 'app/travel_app.dart';
import 'core/database/cache_helper.dart';
import 'core/functiion/check_user_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getIt<CacheHelper>().init();
  checkUserState();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Travel());
}
