import 'package:flutter/material.dart';
import 'package:foodiescalender/helpers/dio_connect.dart';
import 'package:foodiescalender/models/dish.dart';

class DishProvider with ChangeNotifier {
  final List<DishItem> _dishList = [];

  List<DishItem> get items {
    return [..._dishList];
  }

  DishItem findById(String id) {
    return _dishList.firstWhere((element) => element.id == id);
  }

  Future<void> fetchAllDishes() async {
    final dio = await DioClient.provideDio();
    final jsonResponse = await dio.get('api/dish/getAll');
    for (var element in (jsonResponse.data as List)) {
      _dishList.add(DishItem.fromJson(element));
    }
    notifyListeners();
  }

  List<DishItem> fetchSelected() {
    final List<DishItem> shortList = [];
    _dishList.forEach((element) {
      // shortList.where((element),);
    });
    return shortList;
  }
}
