import 'package:flutter/material.dart';
import 'package:foodiescalender/models/dish.dart';
import 'package:foodiescalender/screens/dish_details.dart';
import 'package:provider/provider.dart';

class CardDish extends StatelessWidget {
  const CardDish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dishItem = Provider.of<DishItem>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DishDetails.routeName, arguments: dishItem.id);
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: Hero(
            tag: dishItem.id!,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                dishItem.image!.url!,
              ),
            ),
          ),
          title: Text(dishItem.title!),
          subtitle: Text(
            dishItem.category!,
            style: TextStyle(
              color: (dishItem.category!) == 'veg'
                  ? const Color.fromARGB(156, 0, 172, 0)
                  : const Color.fromARGB(156, 255, 0, 0),
            ),
          ),
        ),
      ),
    );
  }
}
