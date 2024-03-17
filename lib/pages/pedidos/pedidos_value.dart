import 'package:flutter/material.dart';
import 'package:projetomoderno/data/date_list_pedidos.dart';
import 'package:projetomoderno/models/pedidos_model.dart';

class PedidosValue extends StatefulWidget {
  const PedidosValue({super.key});

  @override
  State<PedidosValue> createState() => _PedidosValueState();
}

class _PedidosValueState extends State<PedidosValue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pedidos')),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<PedidosModel>>(
                future: DateListPedidos.getPedidos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color.fromARGB(255, 96, 33, 243),
                        child: ExpansionTile(
                          title: Text('Pedido ${index + 1}'),
                          children:
                              snapshot.data![index].produtos.map((produto) {
                            return ListTile(
                              title: Text(produto.description),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Preço: R\$ ${produto.price.toString()}'),
                                  Text('QTD: ${produto.quantity.toString()}'),
                                  Text(
                                      'Total: ${(produto.quantity * produto.price).toString()}'),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
