import 'package:flutter/material.dart';
import 'package:projetomoderno/components/card_product_item.dart';
import 'package:projetomoderno/states/states_product.dart';
import 'package:projetomoderno/themes/paletadecores.dart';
import 'package:projetomoderno/utils/listCategory.dart';
import 'package:provider/provider.dart';

class TabGondula extends StatefulWidget {
  const TabGondula({super.key});
  @override
  State<TabGondula> createState() => _TabGondulaState();
}

class _TabGondulaState extends State<TabGondula> {
  onCategoryButtonPressed(String category) {
    switch (category) {
      case 'Cereais':
        print('Ação para Cereais');
        break;
      case 'Legumes':
        print('Ação para Legumes');
        break;
      case 'Frutas':
        print('Ação para Frutas');
        break;
      case 'Verduras':
        print('Ação para Verduras');
        break;
      case 'Carnes':
        print('Ação para Carnes');
        break;
      case 'Bebidas':
        print('Ação para Bebidas');
        break;
      case 'Doces':
        print('Ação para Doces');
        break;
      default:
        print('Ação padrão');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final provider = Provider.of<StatesProductCart>(context).products;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: TextFormField(
            autocorrect: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              labelText: 'Pesquisar',
              prefixIcon:
                  IconButton(onPressed: () {}, icon: Icon(Icons.camera)),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categories.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(CustomColors.white),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return CustomColors.lightPurple;
                        } else {
                          return CustomColors.darkPurple;
                        }
                      },
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    onCategoryButtonPressed(categories[index]);
                  },
                  child: Text(categories[index]),
                ),
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
                            crossAxisCount: 3),
                    itemCount: provider.length,
                    itemBuilder: (context, index) {
                      final product = provider.values.toList()[index];
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
        SizedBox(
          width: size.width * 0.6,
          height: 30,
          child:
              ElevatedButton(onPressed: () {}, child: const Text("Pagamento")),
        )
      ],
    );
  }
}
