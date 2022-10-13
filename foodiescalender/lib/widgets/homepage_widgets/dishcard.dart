import 'package:flutter/material.dart';
import 'package:foodiescalender/models/dish.dart';
import 'package:foodiescalender/screens/dish_details.dart';
import 'package:provider/provider.dart';

class CardDish extends StatelessWidget {
  const CardDish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final dishItem = Provider.of<DishItem>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DishDetails.routeName, arguments: dishItem.id);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: dishItem.id!,
              child: SizedBox(
                height: screenSize.height * 0.2,
                width: screenSize.width,
                child: Image.network(
                  dishItem.image!.url!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              dishItem.title!,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              dishItem.category!,
              style: TextStyle(
                color: (dishItem.category!) == 'veg'
                    ? const Color.fromARGB(156, 0, 172, 0)
                    : const Color.fromARGB(156, 255, 0, 0),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
