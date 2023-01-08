import 'package:flutter/material.dart';
import 'package:i_singoji_services/pages/home_page/widgets/footer.dart';
import 'package:i_singoji_services/pages/home_page/widgets/subscription_widget.dart';

import '../../utils/text_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:const Text(appTitle),
      elevation: 0,
    ),
      body: Container(
        padding: EdgeInsets.zero,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(
          children: const [
            SubscribeUs(),
            Footer()
          ],
        )),
      ),
    );
  }
}
