import 'package:flutter/material.dart';
import 'package:foodiescalender/providers/alldish.dart';
import 'package:foodiescalender/screens/category.dart';
import 'package:foodiescalender/screens/dish_details.dart';
import 'package:foodiescalender/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DishProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const CatrgeryPage(),
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          DishDetails.routeName: ((context) => const DishDetails()),
        },
      ),
    );
  }
}
