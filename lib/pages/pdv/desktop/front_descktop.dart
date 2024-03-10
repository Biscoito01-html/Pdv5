import 'package:flutter/material.dart';
import 'package:projetomoderno/pages/pdv/views/tab_caixa.dart';
import 'package:projetomoderno/pages/pdv/views/tab_gondula.dart';

class DesktopSalesPage extends StatelessWidget {
  const DesktopSalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 2, child: TabGondula()),
        Expanded(
          flex: 1,
          child: TabCaixa(),
        ),
      ],
    );
  }
}
