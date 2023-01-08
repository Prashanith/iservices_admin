import 'package:flutter/material.dart';
import 'package:i_singoji_services/utils/style_utils.dart';
import 'package:i_singoji_services/utils/text_utils.dart';

class SubscribeUs extends StatefulWidget {
  const SubscribeUs({super.key});

  @override
  State<SubscribeUs> createState() => _SubscribeUsState();
}

class _SubscribeUsState extends State<SubscribeUs> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController lastNameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      child: Form(
          key: _formKey,
          child: SizedBox(
            width: 220,
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              runAlignment: WrapAlignment.spaceBetween,
              crossAxisAlignment:WrapCrossAlignment.start,
              children: [
                TextFormField(
                  decoration: formFieldDecoration,
                  controller: firstNameController,
                ),
                
                TextFormField(
                  decoration: formFieldDecoration,
                  controller: lastNameController,
                ),
                
                TextFormField(
                  decoration: formFieldDecoration,
                  controller: emailController,
                ),
                TextButton(onPressed: () => {}, child: const Text(subscribeUs))
              ],
            ),
          )),
    );
  }
}
