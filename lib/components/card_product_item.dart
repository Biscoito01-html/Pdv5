import 'package:flutter/material.dart';
import 'package:projetomoderno/models/cart_model.dart';
import 'package:projetomoderno/models/product_model.dart';
import 'package:projetomoderno/states/states_cart_product.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CardProductItem extends StatefulWidget {
  ProductModel product;
  CardProductItem({super.key, required this.product});

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StatesCart>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                widget.product.description,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                width: 300,
                height: 120,
                child: Column(
                  children: [
                    const Text(
                      'Insira a quantidade:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Quantidade',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 0,
                  ),
                  onPressed: () {
                    try {
                      double quantity =
                          double.tryParse(quantityController.text) ?? 0;

                      if (quantity > 0) {
                        provider.addCart(
                          ProductModel(
                            id: widget.product.id,
                            codigodeBarras: widget.product.codigodeBarras,
                            description: widget.product.description,
                            price: widget.product.price,
                            quantity: quantity,
                            imageUrl: widget.product.imageUrl,
                          ),
                        );
                        print('Adicionado ao carrinho');

                        print(quantity);
                      }

                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Adicionar ao Carrinho'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 3,
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 60,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "${widget.product.imageUrl}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 45,
              child: Text(
                widget.product.description,
                style: const TextStyle(
                    fontSize: 10, overflow: TextOverflow.ellipsis),
              ),
            ),
            Text(
              'R\$ ${(widget.product.price).toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
