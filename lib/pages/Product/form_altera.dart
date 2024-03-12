import 'package:flutter/material.dart';

import 'package:projetomoderno/models/product_model.dart';
import 'package:projetomoderno/models/stock_model.dart';
import 'package:projetomoderno/states/states_product.dart';
import 'package:projetomoderno/utils/Strings_constantes.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditProductForm extends StatefulWidget {
  ProductModel productModel;

  EditProductForm({super.key, required this.productModel});
  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController codigodeBarrasController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController validadeController = TextEditingController();

  TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Preencha os controladores com os valores iniciais do produto
    codigodeBarrasController.text = widget.productModel.codigodeBarras ?? '';
    descriptionController.text = widget.productModel.description ?? '';
    priceController.text = widget.productModel.price.toString();
    validadeController.text =
        widget.productModel.validade?.toIso8601String() ?? '';
    quantityController.text = widget.productModel.stock.quantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StatesProductCart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstStrings.PageEditProduct),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: codigodeBarrasController,
                decoration:
                    const InputDecoration(labelText: 'Código de Barras'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um Código de Barras';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O preço não pode estar vazio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: validadeController,
                decoration: const InputDecoration(labelText: 'Validade'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'A validade não pode estar vazia';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: 'Quantidade'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'A quantidade não pode estar vazia ou ser igual a 0';
                  }
                  try {
                    double.parse(value);
                  } catch (e) {
                    return 'Digite um número válido para a quantidade';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      provider.updateProduct(
                        widget.productModel.id as String,
                        ProductModel(
                            id: widget.productModel.id,
                            codigodeBarras: widget.productModel.codigodeBarras =
                                codigodeBarrasController.text,
                            description: widget.productModel.description =
                                descriptionController.text,
                            price: widget.productModel.price =
                                double.parse(priceController.text),
                            validade: widget.productModel.validade =
                                DateTime.parse(validadeController.text),
                            imageUrl: widget.productModel.imageUrl,
                            category: widget.productModel.category,
                            stock: widget.productModel.stock = StockModel(
                              quantity: double.parse(quantityController.text),
                            ),
                            createdAt: widget.productModel.createdAt),
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Erro ao salvar alterações, por favor tente novamente!',
                          ),
                          content: Text(e.toString()),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: const Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
