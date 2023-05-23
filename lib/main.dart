import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iservices/firebase_options.dart';
import 'package:iservices/navigation/route_generator.dart';
import 'package:iservices/navigation/routes.dart';
import 'package:iservices/services/service_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ServiceInitializer.initializeServices();
  runApp(const IServicesApp());
}

class IServicesApp extends StatelessWidget {
  const IServicesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IServicesApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.splashScreen,
      navigatorKey: locator.get<RouteGenerator>().navigatorKey,
    );
  }
}
