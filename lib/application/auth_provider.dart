import 'package:flutter/cupertino.dart';
import 'package:setup_provider/domain/facade/auth_facade.dart';
import 'package:setup_provider/domain/facade/home_facade.dart';
import 'package:setup_provider/infastructura/servises/app_helper.dart';
import 'package:setup_provider/infastructura/servises/local_store.dart';


class AuthProvider extends ChangeNotifier {
  final AuthFacade authRepo;
  final HomeFacade homeRepo;
  bool isLoading = false;

  AuthProvider(this.authRepo, this.homeRepo);

  login(
      {required BuildContext context, required VoidCallback onSuccess}) async {
    isLoading = true;
    notifyListeners();
    final res = await authRepo.login("email");
    res.fold((data) {
      isLoading = false;
      notifyListeners();
      onSuccess();
      LocalStore.setToken(data.firstname);
    }, (error) {
      isLoading = false;
      notifyListeners();
      AppHelper.errorSnackBar(context: context,message: error);
    });
  }

  logOut({required VoidCallback onSuccess}) async {
    LocalStore.clear();
    onSuccess();
  }
}
