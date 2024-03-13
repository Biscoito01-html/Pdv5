import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projetomoderno/models/category_model.dart';
import 'package:projetomoderno/models/product_model.dart';
import 'package:projetomoderno/models/stock_model.dart';
import 'package:projetomoderno/pages/stock/image_picker.dart';
import 'package:projetomoderno/states/states_product.dart';
import 'package:projetomoderno/utils/Strings_constantes.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class FormularioProduct extends StatefulWidget {
  const FormularioProduct({super.key});

  @override
  State<FormularioProduct> createState() => _FormularioProductState();
}

class _FormularioProductState extends State<FormularioProduct> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController codigoDeBarrasController =
      TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController loteController = TextEditingController();
  final TextEditingController validadeStringController =
      TextEditingController();
  final TextEditingController createdAtController = TextEditingController();
  final TextEditingController quantitycontroller = TextEditingController();

  late File imagea;
  Category? selectedCategory;

  // Lista de categorias
  final List<CategoryModel> categories = [
    CategoryModel(name: Category.cereais),
    CategoryModel(name: Category.legumes),
    CategoryModel(name: Category.frutas),
    CategoryModel(name: Category.verduras),
    CategoryModel(name: Category.carnes),
    CategoryModel(name: Category.bebidas),
    CategoryModel(name: Category.doces),
    CategoryModel(name: Category.outros),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void setImage(File image) {
      imagea = image;
    }

    final provider = Provider.of<StatesProductCart>(context);
    var productId = const Uuid().v4();

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstStrings.appName),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  controller: codigoDeBarrasController,
                  decoration: InputDecoration(
                    labelText: 'Código de Barras',
                    border: const OutlineInputBorder(),
                    prefixIcon: IconButton(
                      onPressed: () async {
                        try {
                          String barcodeScanRes =
                              await FlutterBarcodeScanner.scanBarcode(
                            '#ff6666',
                            'Cancelar',
                            true,
                            ScanMode.BARCODE,
                          );
                          if (barcodeScanRes == '-1') {
                            return;
                          }
                          setState(() {
                            codigoDeBarrasController.text = barcodeScanRes;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      icon: const Icon(Icons.qr_code),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira um Código de Barras';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma descrição';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Preço',
                    border: OutlineInputBorder(),
                    prefixText: 'R\$ ',
                    hintText: '0.00',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O preço não pode estar vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: loteController,
                  decoration: const InputDecoration(
                    labelText: 'Lote',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O lote não pode estar vazio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: validadeStringController,
                  decoration: const InputDecoration(
                    labelText: 'Validade',
                    hintText: 'dd/mm/aaaa',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A validade não pode estar vazia';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: quantitycontroller,
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                    hintText: '0.000',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A quantidade não pode estar vazia ou ser igual há 0';
                    }
                    try {
                      double.parse(value);
                    } catch (e) {
                      return 'Digite um número válido para a quantidade';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  width: size.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: DropdownButton<Category>(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    dropdownColor: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    value: selectedCategory,
                    onChanged: (Category? newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    items: categories.map<DropdownMenuItem<Category>>(
                        (CategoryModel category) {
                      return DropdownMenuItem<Category>(
                        value: category.name,
                        child: Text(category.name.toString().split('.')[1]),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                ImagePickter(
                  setImage: setImage,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final DateFormat format = DateFormat('dd/MM/yyyy');
                    if (formKey.currentState!.validate() &&
                        imagea.existsSync()) {
                      formKey.currentState!.save();
                      print(validadeStringController.text);

                      try {
                        DateTime validade =
                            format.parse(validadeStringController.text);
                        print(validade);
                        ProductModel product = ProductModel(
                          id: productId,
                          codigodeBarras: codigoDeBarrasController.text,
                          description: descriptionController.text,
                          price: double.parse(priceController.text),
                          imageUrl: imagea,
                          category: CategoryModel.fromMap(
                            {
                              'name': '$selectedCategory',
                            },
                          ),
                          lote: loteController.text,
                          validade: validade,
                          stock: StockModel(
                            quantity: double.parse(quantitycontroller.text),
                          ),
                          createdAt: DateTime.now(),
                        );
                        provider.addProduct(product);
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Produto criado com sucesso'),
                          ),
                        );
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
                  child: const Text('Salvar Produto'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
