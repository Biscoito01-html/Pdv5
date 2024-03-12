import 'package:flutter/material.dart';
import 'package:projetomoderno/pages/Product/form_altera.dart';
import 'package:projetomoderno/states/states_product.dart';
import 'package:projetomoderno/themes/paletadecores.dart';
import 'package:projetomoderno/utils/Strings_constantes.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StatesProductCart>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppConstStrings.pageProduct),
        ),
        body: Column(
          children: [
            Expanded(
              child: provider.products.isEmpty
                  ? const Center(
                      child: Text('Nenhum item adicionado'),
                    )
                  : ListView.builder(
                      itemCount: provider.products.length,
                      itemBuilder: (context, index) {
                        final product =
                            provider.products.values.toList()[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: CustomColors.black12,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Image.file(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text("R\$ ${product.price}",
                                  style: const TextStyle(fontSize: 12)),
                              Text("QT ${product.stock.quantity}",
                                  style: const TextStyle(fontSize: 12)),
                              Text(
                                  "R\$ ${(product.stock.quantity * product.price).toStringAsFixed(2)}",
                                  style: const TextStyle(fontSize: 12)),
                              IconButton(
                                onPressed: () {
                                  provider.removeProduct(product.id as String);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 18,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return EditProductForm(
                                          productModel: product,
                                        );
                                      },
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.red,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/formInputProduct',
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
