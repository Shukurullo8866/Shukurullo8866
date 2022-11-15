import 'package:flutter/cupertino.dart';
import 'package:todo_ap/storage_servise.dart/storage.dart';


class ThemeProvider extends ChangeNotifier {
  bool _isLight = StorageService.getBool("isLight");

  setIsLight(bool isLight) async {
    _isLight = isLight;
    await StorageService.saveBool("isLight", _isLight);
    notifyListeners();
  }

  getIsLight() {
    return _isLight;
  }
}