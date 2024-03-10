// app_routes.dart
import 'package:flutter/material.dart';

import 'package:projetomoderno/pages/pdv/front_home_sales.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/sales': (context) => const FrontSales(),
  };
}
