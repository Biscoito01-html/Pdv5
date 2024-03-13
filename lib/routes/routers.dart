// app_routes.dart
import 'package:flutter/material.dart';

import 'package:projetomoderno/pages/Product/product_page.dart';
import 'package:projetomoderno/pages/clients/clientes_view_page.dart';
import 'package:projetomoderno/pages/forms/formulario_product.dart';

import 'package:projetomoderno/pages/pdv/front_home_sales.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/sales': (context) => const FrontSales(),
    '/productExibition': (contex) => const ProductPage(),
    '/formInputProduct': (contex) => const FormularioProduct(),
    '/clientExibition': (contex) => ClientesViewPage(),
  };
}
