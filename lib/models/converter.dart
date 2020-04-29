import 'package:flutter/material.dart';

class ConverterModel extends ChangeNotifier {
  bool estado = true;
  int binary = 0;
  int decimal = 0;

  static int binarynumber(int decimal) {
    int binario = 0;
    int factor = 1;
    while (decimal != 0) {
      binario += (decimal % 2) * factor;
      factor *= 10;
      decimal = (decimal / 2).truncate();
    }
    return binario;
  }

  static int decimalnumber(int binario) {
    int decimal = 0;
    int factor = 1;
    while (binario != 0) {
      decimal += (binario % 10) * factor;
      factor *= 2;
      binario = (binario / 10).truncate();
    }
    return decimal;
  }

  void addDigito(int digito) {
    if (estado) {
      binary = binary * 10 + digito;
      // convertir de binario a decimal
      decimal = decimalnumber(binary);
    } else {
      decimal = decimal * 10 + digito;
      // convertir de decimal a binario
      binary = binarynumber(decimal);
    }
    notifyListeners();
  }

  void reset() {
    binary = 0;
    decimal = 0;
    notifyListeners();
  }

  void changeState() {
    estado = !estado;
    notifyListeners();
  }
}
