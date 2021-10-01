import 'package:flutter/cupertino.dart';
import 'package:thebest/models/home_model.dart';
import 'package:thebest/services/get_data.dart';


class HomeProvider with ChangeNotifier {


  Home? homeModel;
  bool loading = true;
  ///loading the data
  void getHomeData()async {


   await GetData.getHomeData().then((model) {


      homeModel = model;
      loading = false;

    }).catchError((error) {
      print(error.toString());

    });
   notifyListeners();
  }
}
