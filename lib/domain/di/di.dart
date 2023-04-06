
import 'package:get_it/get_it.dart';
import 'package:setup_provider/domain/facade/auth_facade.dart';
import 'package:setup_provider/infastructura/repo/auth_repo.dart';

final getIt = GetIt.instance;


setUp(){
  getIt.registerSingleton<AuthFacade>(AuthRepo());
}

final authRepo = getIt.get<AuthFacade>();