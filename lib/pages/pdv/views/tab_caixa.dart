import 'package:flutter/material.dart';
import 'package:projetomoderno/models/pedidos_model.dart';
import 'package:projetomoderno/pages/pdv/views/page_pay.dart';
import 'package:projetomoderno/states/states_cart_product.dart';
import 'package:provider/provider.dart';

class TabCaixa extends StatefulWidget {
  const TabCaixa({Key? key}) : super(key: key);

  @override
  State<TabCaixa> createState() => _TabCaixaState();
}

class _TabCaixaState extends State<TabCaixa> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StatesCart>(context).cart;
    final metodosDeProvider = Provider.of<StatesCart>(context);

    final ammount = provider.values.fold<double>(
      0.0,
      (previousValue, element) =>
          previousValue + (element.price * element.quantity),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.length,
            itemBuilder: (context, index) {
              final cart = provider.values.toList()[index];
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Text("${index + 1}"),
                    ),
                    Text(
                      cart.description,
                      style: const TextStyle(
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${cart.quantity}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      "R\$ ${(cart.price).toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      "R\$ ${(cart.quantity * cart.price).toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Divider(
          color: Colors.black,
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Text("Sub-total"),
              const Spacer(),
              Text("R\$ $ammount"),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text("Desconto na venda"),
              Spacer(),
              Text("R\$ 0,00"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              const Text("Valor a pagar"),
              const Spacer(),
              Text("R\$ $ammount"),
            ],
          ),
        ),
        const Divider(
          color: Colors.black,
          height: 3,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              try {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PagePay(
                      item: ammount,
                      pedido:
                          PedidosModel(produtos: metodosDeProvider.cartItems),
                    ),
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
            child: const Text('Finalizar compra'),
          ),
        ),
      ],
    );
  }
}
