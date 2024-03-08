//----------------------------
// Don't change this file
//----------------------------

import 'package:flutter/foundation.dart';

class ViewModel with ChangeNotifier{
  bool _busy = false;
  get busy => _busy;

  void turnIdle(){
    _busy = true;
  }
  void turnBusy(){
    _busy = false;
    notifyListeners();
  }

  void update(AsyncCallback fn) async{
    turnBusy();
    await fn();
    turnIdle();
  }
}