import 'package:flutter/material.dart';
import 'package:projetomoderno/data/date_list_product.dart';
import 'package:projetomoderno/models/product_model.dart';
import 'package:projetomoderno/pages/Product/form_altera.dart';
import 'package:projetomoderno/states/states_product.dart';
import 'package:projetomoderno/themes/paletadecores.dart';
import 'package:projetomoderno/utils/Strings_constantes.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

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
            child: FutureBuilder<List<ProductModel>>(
              future:
                  DatabaseHelper.products(), // a função que retorna um Future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final product = snapshot.data![index];
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
                              child: Image.network(
                                product.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              product.description,
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              "QT ${product.quantity}",
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              "R\$ ${(product.quantity ?? 0) * (product.price ?? 0)}",
                              style: const TextStyle(fontSize: 12),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Excluir Produto'),
                                        content: const Text(
                                            'Deseja excluir o produto?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancelar'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              provider.removeProduct(
                                                  product.id as String);
                                            },
                                            child: const Text('Excluir'),
                                          ),
                                        ],
                                      );
                                    });
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
                  );
                }
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
      ),
    );
  }
}
