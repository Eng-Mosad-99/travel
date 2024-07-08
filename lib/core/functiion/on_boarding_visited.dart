import 'package:travel/core/services/service_locator.dart';

import '../database/cache_helper.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: 'IsOnBoardingVisited', value: true);
}
