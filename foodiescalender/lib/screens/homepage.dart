import 'package:flutter/material.dart';
import 'package:foodiescalender/providers/alldish.dart';
import 'package:foodiescalender/widgets/homepage_widgets/dishlist.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  @override
  void didChangeDependencies() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<DishProvider>(context, listen: false).fetchAllDishes();
    setState(() {
      isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Dishes'),
      ),
      body: (isLoading)
          ? const Center(child: CircularProgressIndicator())
          : const DishList(),
    );
  }
}
