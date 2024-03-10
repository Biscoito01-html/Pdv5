import 'package:flutter/material.dart';
import 'package:projetomoderno/models/product_model.dart';

// ignore: must_be_immutable
class CardProductItem extends StatefulWidget {
  ProductModel product;
  CardProductItem({super.key, required this.product});

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('CardProductItem');
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
      )),
    );
  }
}
