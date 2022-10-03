// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodiescalender/screens/homepage.dart';

class CatogeryCard extends StatelessWidget {
  String title;
  CatogeryCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(HomePage.routeName);
          },
          child: Container(
            height: screenSize.height * 0.15,
            width: screenSize.height * 0.22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
