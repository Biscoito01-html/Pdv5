import 'package:flutter/material.dart';
import 'package:projetomoderno/data/date_list_pedidos.dart';
import 'package:projetomoderno/data/date_list_product.dart';

import 'package:projetomoderno/models/pedidos_model.dart';
import 'package:projetomoderno/models/product_model.dart';
import 'package:projetomoderno/states/states_cart_product.dart';
import 'package:projetomoderno/states/states_money_caixa.dart';
import 'package:projetomoderno/states/states_pedidos_produtct.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PagePay extends StatefulWidget {
  final PedidosModel pedido;
  final double item;
  PagePay({super.key, required this.item, required this.pedido});

  @override
  State<PagePay> createState() => _PagePayState();
}

class _PagePayState extends State<PagePay> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StatesMoneyCaixa>(context);
    final cart = Provider.of<StatesCart>(context);
    final pedidos = Provider.of<StatesPedidosProdutct>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Pagamento')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Valor Total R\$ ${(widget.item).toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          provider.somar(widget.item, 'pix');
                          final PedidosModel pedidosems = PedidosModel(
                            id: const Uuid().v4(),
                            produtos: cart.cartItems,
                          );
                          await DateListPedidos.insertPedido(pedidosems);
                          await DatabaseHelper.updateProducts(cart.cartItems);
                          cart.finalizarPedido();
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Column(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.green),
                                  Text('Pagamento realizado com sucesso!'),
                                ],
                              ),
                            ),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.pix),
                          Text('Pix'),
                        ],
                      )),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          provider.somar(widget.item, 'cartao');
                          pedidos.addPedidos(pedidos.pedidosItems);
                          final PedidosModel pedidosems = PedidosModel(
                            id: const Uuid().v4(),
                            produtos: cart.cartItems,
                          );
                          await DateListPedidos.insertPedido(pedidosems);
                          await DatabaseHelper.updateProducts(cart.cartItems);
                          cart.finalizarPedido();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Column(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.green),
                                  Text('Pagamento realizado com sucesso!'),
                                ],
                              ),
                            ),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.credit_card),
                          Text('Cartão de credito'),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          provider.somar(widget.item, 'dinheiro');

                          final PedidosModel pedidosems = PedidosModel(
                            id: const Uuid().v4(),
                            produtos: cart.cartItems,
                          );
                          await DateListPedidos.insertPedido(pedidosems);

                          await DatabaseHelper.updateProducts(cart.cartItems);

                          cart.finalizarPedido();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Column(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.green),
                                  Text('Pagamento realizado com sucesso!'),
                                ],
                              ),
                            ),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.monetization_on_outlined),
                          Text('Dinheiro'),
                        ],
                      )),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Pagamento com Crediario');
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Beta',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.calendar_view_day_outlined),
                        Text('Crediario'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
