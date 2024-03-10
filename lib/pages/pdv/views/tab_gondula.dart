import 'package:flutter/material.dart';
import 'package:projetomoderno/themes/paletadecores.dart';

import 'package:projetomoderno/utils/listCategory.dart';

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
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: TextFormField(
            autocorrect: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              labelText: 'Pesquisar',
              prefixIcon: Icon(Icons.search),
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
                    foregroundColor: MaterialStateProperty.all(
                      CustomColors.white,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      CustomColors.darkPurple,
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
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: ElevatedButton(onPressed: () {}, child: Text("Pagamento")),
        )
      ],
    );
  }
}
