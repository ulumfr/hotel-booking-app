import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/constants.dart';
import 'package:hotel_booking_app/controllers/auth/appwrite/auth_appwrite_controller.dart';
import 'package:hotel_booking_app/controllers/main/home/profile_screen_controller.dart';
import 'package:hotel_booking_app/models/auth/user_model.dart';
import 'package:hotel_booking_app/views/main/components/profile/text_field_profile.dart';

class EditProfileScreen extends GetView<ProfileScreenController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final con = Get.find<AuthAppwriteController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColors.blackColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.gray1Color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        iconTheme: const IconThemeData(
          color: AppColors.blackColor, 
        ),
        actions: [
          GestureDetector(
            onTap: () {
              controller.toggleEditing();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 85,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage(
                        "assets/images/profile.png",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return TextFieldProfile(
                    text: 'ini nama',
                    controllerText: controller.nameController,
                    isEnabled: controller.isEditing.value,
                  );
                }),
                Obx(() {
                  return TextFieldProfile(
                    text: 'ini phone',
                    controllerText: controller.phoneController,
                    isEnabled: controller.isEditing.value,
                  );
                }),
                Obx(() {
                  return TextFieldProfile(
                    text: 'ini email',
                    controllerText: controller.emailController,
                    isEnabled: controller.isEditing.value,
                  );
                }),
                Obx(() {
                  return TextFieldProfile(
                    text: 'ini password',
                    controllerText: controller.passwordController,
                    obscureText: true,
                    isEnabled: controller.isEditing.value,
                  );
                }),
                Obx(() {
                  return Visibility(
                    visible: controller.isEditing.value,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.toggleEditing();
                        con.updateDoc();
                      },
                      child: const Text('Save'),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
