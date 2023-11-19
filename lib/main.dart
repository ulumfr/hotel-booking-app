import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/controllers/auth/auth_controller.dart';
import 'package:hotel_booking_app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.lazyPut(() => AuthController()));
  await Get.putAsync(() async => await SharedPreferences.getInstance());

  //  Get.put(AuthController());  // Register AuthController here
  // Get.lazyPut(() => AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hotel Booking',
      initialRoute: '/welcome',
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
