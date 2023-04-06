import 'package:flutter/cupertino.dart';
import 'package:setup_provider/domain/facade/home_facade.dart';
import 'package:setup_provider/infastructura/servises/app_helper.dart';


class AuthProvider extends ChangeNotifier {
  final HomeFacade homeRepo;
  bool isLoading = false;

  AuthProvider(this.homeRepo);

  login(
      {required BuildContext context, required VoidCallback onSuccess}) async {
    isLoading = true;
    notifyListeners();
    final res = await homeRepo.getRestaurants();
    res.fold((data) {
      isLoading = false;
      notifyListeners();
      onSuccess();
    }, (error) {
      isLoading = false;
      notifyListeners();
      AppHelper.errorSnackBar(context: context, message: error);
    });
  }
}
