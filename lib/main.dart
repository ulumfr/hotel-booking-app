import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hotel_booking_app/controllers/main/home/profile_screen_controller.dart';
import 'package:hotel_booking_app/controllers/auth/firebase/auth_firebase_controller.dart';
import 'package:hotel_booking_app/controllers/notification/notification_handler.dart';
import 'package:hotel_booking_app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  // Get.put(ProfileScreenController()); // BUAT APPWRITE
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthFirebaseController()));
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hotel Booking',
      home: const CircularProgressIndicator(),
      initialRoute: '/welcome',
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
