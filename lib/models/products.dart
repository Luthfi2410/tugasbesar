import 'package:flutter/material.dart';
import '../data/database_helper.dart';

class Product {
  final String image, title, description;
  final int price, id;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
}

