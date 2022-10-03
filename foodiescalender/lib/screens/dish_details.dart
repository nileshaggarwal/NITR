import 'package:flutter/material.dart';
import 'package:foodiescalender/providers/alldish.dart';
import 'package:foodiescalender/widgets/dishdetail_widgets/details.dart';
import 'package:provider/provider.dart';

class DishDetails extends StatelessWidget {
  static const routeName = '/dishdetails';
  const DishDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dishID = ModalRoute.of(context)?.settings.arguments as String;
    final loadedDish = Provider.of<DishProvider>(context).findById(dishID);
    return Scaffold(
      body: ListView(
        children: [
          Hero(
            tag: loadedDish.id!,
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.network(
                loadedDish.image!.url!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            loadedDish.title!,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            loadedDish.category!,
            style: TextStyle(
              color: (loadedDish.category!) == 'veg'
                  ? const Color.fromARGB(156, 0, 172, 0)
                  : const Color.fromARGB(156, 255, 0, 0),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DetailsDishCard(
            mainTitle: 'INGREDIENTS',
            contain: loadedDish.ingredients!,
          ),
          DetailsDishCard(
            mainTitle: 'RECIPE',
            contain: loadedDish.recipe!,
          ),
        ],
      ),
    );
  }
}
