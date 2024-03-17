import 'package:flutter/material.dart';

import 'package:projetomoderno/components/button_principlay.dart';
import 'package:projetomoderno/components/grafico_vendas.dart';
import 'package:projetomoderno/pages/HomePage/total_geral.dart';
import 'package:projetomoderno/states/states_money_caixa.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DataPoint> salesData = [];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<StatesMoneyCaixa>(context, listen: false);
    salesData.add(DataPoint(DateTime.now(), provider.moneyTotal));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StatesMoneyCaixa>(
      builder: (context, provider, child) {
        if (salesData.isEmpty || salesData.last.value != provider.moneyTotal) {
          salesData.add(DataPoint(DateTime.now(), provider.moneyTotal));
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: LiveUpdateChart(
                  key: UniqueKey(),
                  initialData: salesData,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                width: 250,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Vendas',
                        style: Theme.of(context).textTheme.titleLarge),
                    const TotalGeral()
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonPrinciplay(
                    icon: const Icon(
                      Icons.store_mall_directory_sharp,
                    ),
                    text: 'Vendas',
                    onTap: () {
                      Navigator.pushNamed(context, '/sales');
                    },
                  ),
                  ButtonPrinciplay(
                    icon: const Icon(
                      Icons.post_add_rounded,
                    ),
                    text: 'Produtos',
                    onTap: () {
                      Navigator.pushNamed(context, '/productExibition');
                    },
                  ),
                  ButtonPrinciplay(
                    icon: const Icon(
                      Icons.people,
                    ),
                    text: 'Clientes',
                    onTap: () {
                      Navigator.pushNamed(context, '/clientExibition');
                    },
                  ),
                  ButtonPrinciplay(
                    icon: const Icon(
                      Icons.real_estate_agent_outlined,
                    ),
                    text: 'Pedidos',
                    onTap: () {
                      Navigator.pushNamed(context, '/pedidos');
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
