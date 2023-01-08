import 'package:flutter/material.dart';
import 'package:i_singoji_services/utils/style_utils.dart';
import 'package:i_singoji_services/utils/text_utils.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.black,
      child: Wrap(
        children: [
          Row(
            children: const [
              CircleAvatar(
                child: Text('IS'),
              ),
              Text(
                appTitle,
                style: textStyle,
              )
            ],
          ),
          const Text(
            aboutText,
            style: textStyle,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () => {}, icon: const Icon(Icons.social_distance)),
              IconButton(
                  onPressed: () => {}, icon: const Icon(Icons.social_distance)),
              IconButton(
                  onPressed: () => {}, icon: const Icon(Icons.social_distance))
            ],
          )
        ],
      ),
    );
  }
}
