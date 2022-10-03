import 'package:flutter/material.dart';

class DetailsDishCard extends StatelessWidget {
  final String mainTitle;
  final String contain;
  const DetailsDishCard({
    required this.mainTitle,
    required this.contain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1),
            Text(contain),
          ],
        ),
      ),
    );
  }
}
