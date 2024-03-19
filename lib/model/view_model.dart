//----------------------------
// Don't change this file
//----------------------------

import 'package:flutter/foundation.dart';

class ViewModel with ChangeNotifier{
  bool _busy = false;
  get busy => _busy;

  void turnIdle(){
    _busy = false;
    notifyListeners();
  }
  void turnBusy(){
    _busy = true;
  }

  void update(AsyncCallback fn) async{
    turnBusy();
    await fn();
    turnIdle();
  }
}