import 'package:flutter/material.dart';

class WidgetsController extends ChangeNotifier {
  //bottom navigator index
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

//obsecure text
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void toggleVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
