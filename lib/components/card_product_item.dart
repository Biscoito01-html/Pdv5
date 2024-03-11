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
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                widget.product.description,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Column(
                children: [
                  Text(
                    'Insira a quantidade:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantidade',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                ],
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
                          CartModel(
                            id: widget.product.id,
                            codigodeBarras: widget.product.codigodeBarras,
                            description: widget.product.description,
                            price: widget.product.price,
                            lote: widget.product.lote,
                            quantity: quantity,
                            createdAt: DateTime.now(),
                          ),
                        );
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
        child: Column(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  widget.product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text('${widget.product.price}'),
          ],
        ),
      ),
    );
  }
}
