import 'package:flutter/material.dart';
import 'package:foodiescalender/providers/alldish.dart';
import 'package:foodiescalender/widgets/categoryPage_widgets/card.dart';
import 'package:provider/provider.dart';

class CatrgeryPage extends StatelessWidget {
  const CatrgeryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List dataList = Provider.of<DishProvider>(context).fetchSelected();
    return Scaffold(
      appBar: AppBar(
        title: const Text('FOOD CATEGORIES'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'PREFRENCE?',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CatogeryCard(title: 'VEG'),
              CatogeryCard(title: 'NON-VEG'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'TYPE',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CatogeryCard(title: 'SNACKS'),
              CatogeryCard(title: 'LUNCH/DINNER'),
            ],
          ),
        ],
      ),
    );
  }
}
