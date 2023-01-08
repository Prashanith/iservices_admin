import 'package:flutter/material.dart';
import 'package:i_singoji_services/utils/text_utils.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:const Text(appTitle),
      elevation: 0,
    );
  }
}
