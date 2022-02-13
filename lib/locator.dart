import 'package:get_it/get_it.dart';
import 'package:lookmyvenue_app/repository/auth_repo.dart';
import 'package:lookmyvenue_app/repository/storage_repo.dart';

import 'controlers/user_controller.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthRepo>(AuthRepo());
  locator.registerSingleton<StorageRepo>(StorageRepo());
  locator.registerSingleton<UserController>(UserController());
}
