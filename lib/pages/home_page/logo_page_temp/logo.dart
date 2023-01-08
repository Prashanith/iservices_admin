import 'dart:math';

import 'package:flutter/material.dart';

class ISingojiServicesLogo extends StatelessWidget {
  const ISingojiServicesLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.17;
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          'ISingoji Services',
          style: TextStyle(fontSize: min(height, 100)),
        ));
  }
}
