import 'package:flutter/material.dart';
import 'package:projetomoderno/pages/pdv/desktop/front_descktop.dart';
import 'package:projetomoderno/pages/pdv/mobile/front_mobile.dart';
import 'package:projetomoderno/utils/Strings_constantes.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FrontSales extends StatefulWidget {
  const FrontSales({super.key});

  @override
  State<FrontSales> createState() => _FrontSalesState();
}

class _FrontSalesState extends State<FrontSales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstStrings.pdv),
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.isDesktop) {
            return const DesktopSalesPage();
          } else {
            return const MobileSalesPage();
          }
        },
      ),
    );
  }
}
