import 'package:flutter/material.dart';
import 'package:simple_calculator/shared/theme.dart';

class CalculatorProvider with ChangeNotifier {
  List<String> leftNumber = [];
  List<String> rightNumber = [];
  String? op = '';
  double? result = 0;

  bool _isDarkTheme = true;

  bool get isDarkTheme => _isDarkTheme;

  void toggleAppTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  List<String>? addDigitToNumber(String number) {
    if (op == '' || leftNumber.isEmpty) {
      if (leftNumber.isEmpty && number == '0') {
        return leftNumber;
      }
      if (leftNumber.contains('.') && number == '.') {
        return leftNumber;
      }
      leftNumber.add(number);
      notifyListeners();
      return leftNumber;
    } else if (leftNumber.isNotEmpty) {
      if (rightNumber.contains('.') && number == '.') {
        return rightNumber;
      }
      rightNumber.add(number);
      notifyListeners();
      return rightNumber;
    } else {
      return null;
    }
  }

  void addDigitToOp(String? op) {
    if (op == 'C') {
      clearCalculator();
    }
    if (result != 0 && leftNumber.isEmpty) {
      leftNumber = result.toString().split('');
      result = 0;
      this.op = op;
    } else {
      if (leftNumber.isEmpty) {
        return;
      } else if (op == '%') {
        percentage();
      } else if (op == '=') {
        calculation();
      } else if (op == String.fromCharCode(0x2190)) {
        if (rightNumber.isNotEmpty) {
          rightNumber.removeLast();
        } else if (this.op != '') {
          this.op = '';
        } else if (leftNumber.isNotEmpty) {
          leftNumber.removeLast();
        }
      } else {
        this.op = op;
      }
    }
    notifyListeners();
  }

  void percentage() {
    if (rightNumber.isEmpty && op == '') {
      double a = double.parse(leftNumber.join()) / 100;
      leftNumber = a.toString().split('');
    } else if (rightNumber.isEmpty && op != '') {
      return;
    } else {
      double a = double.parse(rightNumber.join()) / 100;
      rightNumber = a.toString().split('');
    }
    notifyListeners();
  }

  double? calculation() {
    if (leftNumber.isEmpty || rightNumber.isEmpty) {
      return 0;
    }

    double l = double.parse(leftNumber.join());
    double r = double.parse(rightNumber.join());

    if (op == '+') {
      result = l + r;
    } else if (op == '-') {
      result = l - r;
    } else if (op == 'X') {
      result = l * r;
    } else if (op == String.fromCharCode(0x00F7)) {
      result = l / r;
    } else {
      result = 0.0;
    }

    leftNumber = [];
    rightNumber = [];
    op = '';
    notifyListeners();
    return result;
  }

  void clearCalculator() {
    leftNumber = [];
    rightNumber = [];
    op = '';
    result = 0;
    notifyListeners();
  }
}
