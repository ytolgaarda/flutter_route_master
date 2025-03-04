import 'package:get_it/get_it.dart';

import 'router/manager/route_manager.dart';

final sl = GetIt.instance;

void registerRouter() {
  sl.registerLazySingleton<RouterManager>(() => RouterManager());
}
