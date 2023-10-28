import 'package:flutter/cupertino.dart';

class LanguageChangeProvider with ChangeNotifier{
  Locale _currentLocal = const Locale('en');
  Locale get currentLocal => _currentLocal;
  void changeLocal (String local){
    _currentLocal =Locale(local);
    notifyListeners();
  }
}
