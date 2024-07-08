import 'package:get_it/get_it.dart';
import 'package:travel/core/database/cache_helper.dart';
import 'package:travel/features/auth/data/auth_cubit/cubit/auth_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
