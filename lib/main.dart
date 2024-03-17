import 'package:flutter/material.dart';
import 'package:projetomoderno/pages/HomePage/myPrincipalHomePage.dart';
import 'package:projetomoderno/routes/routers.dart';
import 'package:projetomoderno/states/states_cart_product.dart';
import 'package:projetomoderno/states/states_money_caixa.dart';
import 'package:projetomoderno/states/states_pedidos_produtct.dart';
import 'package:projetomoderno/states/states_product.dart';
import 'package:projetomoderno/themes/usecasethema.dart';
import 'package:projetomoderno/utils/Strings_constantes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StatesProductCart(),
        ),
        ChangeNotifierProvider(
          create: (context) => StatesCart(),
        ),
        ChangeNotifierProvider(
          create: (context) => StatesMoneyCaixa(),
        ),
        ChangeNotifierProvider(
          create: (context) => StatesPedidosProdutct(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: buildThemeData(),
        home: const MyHomePage(title: AppConstStrings.homePageTitle),
        routes: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
