import 'package:flutter/material.dart';

class TabCaixa extends StatefulWidget {
  const TabCaixa({super.key});

  @override
  State<TabCaixa> createState() => _TabCaixaState();
}

class _TabCaixaState extends State<TabCaixa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              //Aqui será inserido a lista de compras
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [Text('data')],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
                height: 3,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text("Subtotal"),
                    Spacer(),
                    Text("R\$ 0,00"),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text("Desconto na venda"),
                    Spacer(),
                    Text("R\$ 0,00"),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          height: 3,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Finalizar compra'),
          ),
        ),
      ],
    );
  }
}
