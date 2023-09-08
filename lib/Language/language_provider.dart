import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeProvider with ChangeNotifier{
  Locale _currentLocal = const Locale('en');
  Locale get currentLocal => _currentLocal;
  void changeLocal (String local){
    _currentLocal =Locale(local);
    notifyListeners();
  }
}


// class LanguageChangeController with ChangeNotifier{
//   Locale? _appLocal;
//   Locale? get appLocal => _appLocal;
//   void changeLanguage (Locale type)async{
//     SharedPreferences sp = await SharedPreferences.getInstance();
//
//     if(type==const Locale('en')){
//       await sp.setString('language_code', 'en');
//     }else{
//       await sp.setString('language_code', 'bn');
//     }
//
//     notifyListeners();
//
//   }
// }