import 'package:flutter/material.dart';

Widget doctorImage(String image) {
  return Expanded(
      child: Container(
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image))),
  ));
}
