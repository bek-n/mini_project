import 'package:flutter/cupertino.dart';
import 'package:setup_provider/domain/facade/home_facade.dart';
import 'package:setup_provider/domain/model/restaurant_model.dart';
import 'package:setup_provider/infastructura/servises/app_helper.dart';

class HomeProvider extends ChangeNotifier {
  final HomeFacade homeRepo;

  bool isLoading = false;

  HomeProvider(this.homeRepo);

  List<Datum> lst = [];
  Translation? tr;

  getInfos({
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();
    final res = await homeRepo.getRestaurants();
    

    res.fold((data) {
      lst = data.data ?? [];
      tr = data.restaurant;
     
      isLoading = false;
      notifyListeners();
    }, (error) {
      isLoading = false;
      notifyListeners();
      AppHelper.errorSnackBar(context: context, message: error);
    });
  }
}
