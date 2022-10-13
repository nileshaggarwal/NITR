import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/alldish.dart';
import 'dishcard.dart';

class DishList extends StatelessWidget {
  const DishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dishData = Provider.of<DishProvider>(context, listen: false);
    final dishes = dishData.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
      ),
      itemCount: dishes.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: dishes[index],
        child: const CardDish(),
      ),
    );
  }
}
