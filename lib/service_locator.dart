import 'package:get_it/get_it.dart';
import 'package:deaf_mute_educational_app/scoped_models/home_view_model.dart';
import 'package:deaf_mute_educational_app/services/firebase_service.dart';

GetIt locator = new GetIt();

void setupLocator() {
  // Register services
  locator.registerLazySingleton(() => FirebaseService());
    
  // Register ScopedModels
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}

