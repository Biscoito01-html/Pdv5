import 'package:flutter/material.dart';

class FormularioProduct extends StatefulWidget {
  FormularioProduct({super.key});

  @override
  State<FormularioProduct> createState() => _FormularioProductState();
}

class _FormularioProductState extends State<FormularioProduct> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              labelText: 'Pesquisar',
              prefixIcon: Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }
}
