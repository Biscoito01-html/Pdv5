import 'package:flutter/material.dart';
import 'package:projetomoderno/states/states_money_caixa.dart';
import 'package:provider/provider.dart';

class TotalGeral extends StatelessWidget {
  const TotalGeral({super.key});

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<StatesMoneyCaixa>(context);
    return Column(
      children: [
        Text(
          'Total: R\$ ${provide.moneyTotal.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Cartão credito: R\$ ${provide.moneyCartao.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Pix: R\$ ${provide.moneyPix.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          'Dinheiro: R\$ ${provide.money.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
