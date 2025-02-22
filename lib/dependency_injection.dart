import 'package:get_it/get_it.dart';
import 'package:route_master/router/route_master.dart';

final sl = GetIt.instance;

void setupServiceLocator() =>
    sl.registerSingleton<RouteMaster>(RouteMaster.instance);
