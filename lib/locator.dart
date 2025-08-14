import 'package:get_it/get_it.dart';
import 'package:skill_playground/services/app_injection_service.dart';

final sl = GetIt.instance;

void initLocator() {
  sl.registerLazySingleton<AppInjectionService>(() => AppInjectionService());
}
