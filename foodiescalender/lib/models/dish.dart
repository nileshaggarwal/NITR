import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DishItem with ChangeNotifier {
  String? id;
  String? title;
  String? recipe;
  int? likes;
  Images? image;
  String? category;
  String? ingredients;
  String? schedule;

  DishItem({
    this.id,
    this.title,
    this.recipe,
    this.likes,
    this.image,
    this.category,
    this.ingredients,
    this.schedule,
  });

  DishItem.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String;
    title = json['title'] as String;
    recipe = json['recipe'] as String;
    likes = json['likes'] as int;
    ingredients = json['ingredients'] as String;
    schedule = json['schedule'] as String;
    category = json['category'] as String;
    image = Images.fromJson(json['image'][0]);
  }
}

class Images {
  String? url;
  String? id;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'] as String;
    id = json['_id'] as String;
  }
}
