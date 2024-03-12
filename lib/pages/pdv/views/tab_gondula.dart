import 'package:flutter/material.dart';
import 'package:projetomoderno/components/card_product_item.dart';
import 'package:projetomoderno/models/product_model.dart';
import 'package:projetomoderno/states/states_product.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class TabGondula extends StatefulWidget {
  const TabGondula({super.key});
  @override
  State<TabGondula> createState() => _TabGondulaState();
}

class _TabGondulaState extends State<TabGondula> {
  List<ProductModel> produtoslistados = [];
  final TextEditingController codigoDeBarrasController =
      TextEditingController();

  void updateProductList(String searchTerm) {
    final provider =
        Provider.of<StatesProductCart>(context, listen: false).products;

    try {
      final filteredProducts = provider.values
          .where((element) =>
              element.description
                  .toLowerCase()
                  .contains(searchTerm.toLowerCase()) ||
              element.codigodeBarras!.contains(searchTerm.toLowerCase()))
          .toList();

      setState(() {
        produtoslistados = filteredProducts;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: TextFormField(
            autocorrect: true,
            onChanged: (value) {
              updateProductList(value);
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              labelText: 'Pesquisar',
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
                    updateProductList(barcodeScanRes);
                  } catch (e) {
                    print(e);
                  }
                },
                icon: const Icon(Icons.camera),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: produtoslistados.length,
                    itemBuilder: (context, index) {
                      final product = produtoslistados[index];
                      return CardProductItem(product: product);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
