import 'package:flutter/material.dart';
import 'package:projetomoderno/components/button_principlay.dart';
import 'package:projetomoderno/pages/HomePage/total_geral.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).secondaryHeaderColor,
            ),
            width: 350,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Vendas', style: Theme.of(context).textTheme.titleLarge),
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
            ],
          ),
        ],
      ),
    );
  }
}
