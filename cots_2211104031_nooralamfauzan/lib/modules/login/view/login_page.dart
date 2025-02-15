import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Image.asset('assets/icons/back.png',
                        width: 24, height: 24), // Perbaiki path gambar
                    onPressed: () => Get.back(),
                  ),
                  Image.asset('../../../../asset/image/gojek.png',
                      width: 90), // Perbaiki path gambar
                  Spacer(),
                  IconButton(
                    icon: Image.asset('assets/icons/tanya.png',
                        width: 24, height: 24), // Perbaiki path gambar
                    onPressed: () {
                      // Navigasi ke halaman bantuan
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Teks Header
              Text(
                'Login',
                style: AppTypography.h1.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your registered phone number to log in',
                style: AppTypography.bodyText
                    .copyWith(color: AppColors.greyMedium),
              ),
              const SizedBox(height: 24),
              // Input Nomor Telepon
              TextField(
                keyboardType: TextInputType.phone,
                onChanged: (value) => controller.phoneNumber.value = value,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '+62',
                      style: AppTypography.bodyText,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth: 40),
                  labelText: 'Phone number',
                  border: const OutlineInputBorder(),
                  suffixIcon: controller.phoneNumber.value.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => controller.phoneNumber.value = '',
                        ),
                ),
              ),
              const SizedBox(height: 8),
              // Link untuk masalah nomor
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Navigasi ke halaman "Issue with number?"
                  },
                  child: Text(
                    'Issue with number?',
                    style: AppTypography.bodyText
                        .copyWith(color: AppColors.primaryBlue),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Tombol Continue
              Obx(() {
                return ElevatedButton(
                  onPressed: controller.phoneNumber.value.isEmpty
                      ? null
                      : () => controller.login(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: AppColors.white)
                      : Text(
                          'Continue',
                          style:
                              AppTypography.h4.copyWith(color: AppColors.white),
                        ),
                );
              }),
              const Spacer(),
              // Keypad simulasi (opsional)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  if (index == 9) return const SizedBox();
                  if (index == 11) {
                    return IconButton(
                      icon: const Icon(Icons.backspace,
                          color: AppColors.greyMedium),
                      onPressed: () => controller.phoneNumber.value = '',
                    );
                  }
                  final number = (index == 10) ? 0 : index + 1;
                  return TextButton(
                    onPressed: () {
                      controller.phoneNumber.value += number.toString();
                    },
                    child: Text(
                      '$number',
                      style: AppTypography.h1.copyWith(color: AppColors.black),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
