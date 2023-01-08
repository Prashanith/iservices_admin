import 'package:flutter/material.dart';

const double appBarHeight = 60;

const TextStyle textStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w500
);

InputDecoration formFieldDecoration = InputDecoration(
    filled: true,
    hoverColor: Colors.grey,
    fillColor: Colors.grey.withOpacity(0.2),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6))));
