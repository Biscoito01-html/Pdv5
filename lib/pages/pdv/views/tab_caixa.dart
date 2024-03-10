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
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              /* Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('teste'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.highlight_remove_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
              /*  ListView.builder(
                itemBuilder: (context, index) => Text('teste'),
                itemCount: 10,
              ),*/
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
