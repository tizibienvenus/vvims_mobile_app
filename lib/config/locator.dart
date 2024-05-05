import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vvims/config/language_service.dart';
import 'package:vvims/config/storage_service.dart';

GetIt locator = GetIt.instance;

/// Should only be called at initial app start.
Future<void> setupInitialLocator() async {
  await _setupAppLocator();
  // setupUserDependentLocator();
}

/// Registers all services that are required by the app itself.
Future<void> _setupAppLocator() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  locator.registerLazySingleton<StorageServices>(
      () => StorageServices(preferences));
  locator.registerLazySingleton<LanguageService>(() => LanguageService());
}

void restartUserServices() {
  // You might need to unregister things like a SwipeCubit too
  // setupUserDependentLocator();
}
