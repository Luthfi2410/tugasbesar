import 'package:flutter/material.dart';

Widget topProductContainer(context, image, product, color) {
  return Container(

    
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color,
    ),
    padding: EdgeInsets.all(10),
    width: 100,
    height: 180,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          image,
          height: 100,
        ),
        Text(
          product,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}