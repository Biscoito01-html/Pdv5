import 'package:flutter/material.dart';

class StatesMoneyCaixa with ChangeNotifier {
  double _moneyPix = 0.0;
  double _moneyCartao = 0.0;
  double _money = 0.0;
  double _moneyTotal = 0.0;

  double get moneyTotal => _moneyTotal;
  set moneyTotal(double value) {
    _moneyTotal = value;
    notifyListeners();
  }

  double get moneyPix => _moneyPix;
  set moneyPix(double value) {
    _moneyPix = value;
    notifyListeners();
  }

  double get moneyCartao => _moneyCartao;
  set moneyCartao(double value) {
    _moneyCartao = value;
    notifyListeners();
  }

  double get money => _money;
  set money(double value) {
    _money = value;
    notifyListeners();
  }

  void somar(double value, String type) {
    switch (type) {
      case 'pix':
        moneyPix += value;
        print(moneyPix);
        break;
      case 'cartao':
        moneyCartao += value;
        print(moneyCartao);
        break;
      case 'dinheiro':
        money += value;
        print(money);
        break;
      default:
        money += value;
        break;
    }

    moneyTotal = moneyPix + moneyCartao + money;
  }
}
