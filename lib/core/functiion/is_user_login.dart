 import 'package:travel/core/database/cache_helper.dart';
import 'package:travel/core/services/service_locator.dart';

void isUserLogin() {
    getIt<CacheHelper>()
        .saveData(key: 'isLogin', value: true);
  }