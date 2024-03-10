import 'package:flutter/material.dart';
import 'package:projetomoderno/pages/pdv/views/tab_caixa.dart';
import 'package:projetomoderno/pages/pdv/views/tab_gondula.dart';

class MobileSalesPage extends StatelessWidget {
  const MobileSalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [TabGondula(), TabCaixa()],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.category)),
            Tab(icon: Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}
