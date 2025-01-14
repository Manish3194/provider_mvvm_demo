

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_mvvm_demo/repository/auth_repository.dart';
import 'package:provider_mvvm_demo/utils/app_string.dart';
import 'package:provider_mvvm_demo/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUploading => _signUpLoading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading= value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{

    setLoading(true);

      _myRepo.loginApi(data).then((value){
        setLoading(false);
        Utils.flushBarErrorMessage('Success', context);
        Navigator.pushNamed(context, RouteName.home);
        if (kDebugMode) {
          print(value.toString());
        }

        
      }).onError((error, stackTrace){
        setLoading(false);
        if (kDebugMode) {
          print(error.toString());
        }
      });


  }

  Future<void> signUpApi(dynamic data, BuildContext context) async{

    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('Success', context);
      Navigator.pushNamed(context, RouteName.home);
      if (kDebugMode) {
        print(value.toString());
      }


    }).onError((error, stackTrace){
      setSignUpLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });


  }
}