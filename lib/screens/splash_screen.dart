import 'package:flutter/material.dart';
import 'package:iservices/controllers/controllers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with ControllersMixin {
  @override
  void initState() {
    initializeServices();
    super.initState();
  }

  Future<void> initializeServices() async {
    await Future.delayed(const Duration(seconds: 2));
    serviceController.postInitialization();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Image(image: AssetImage('assets/images/logo.png')));
  }
}
