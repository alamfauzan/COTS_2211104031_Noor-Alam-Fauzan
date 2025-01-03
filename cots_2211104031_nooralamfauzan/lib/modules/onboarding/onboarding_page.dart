import 'package:cots_2211104031_nooralamfauzan/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../design_system/colors.dart';
import '../../../design_system/typography.dart';


class OnboardingView extends StatelessWidget {
  final OnboardingController controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Logo Header
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/gojek.png',
                    width: 70), // Logo lebih kecil
                Image.asset('assets/images/ind.png', width: 30),
              ],
            ),
          ),
          // Slide Onboarding
          Expanded(
            child: PageView(
              onPageChanged: (index) => controller.updateIndex(index),
              children: [
                buildOnboardingSlide(
                  imagePath: 'assets/images/onboarding1.png',
                  title: 'Selamat datang di gojek!',
                  description:
                      'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun.',
                ),
                buildOnboardingSlide(
                  imagePath: 'assets/images/onboarding2.png',
                  title: 'Transportasi & logistik',
                  description:
                      'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~',
                ),
                buildOnboardingSlide(
                  imagePath: 'assets/images/onboarding3.png',
                  title: 'Pesan makan & belanja',
                  description:
                      'Lagi ngidam sesuatu? Gojek beliin gak pakai lama.',
                ),
              ],
            ),
          ),
          // Indikator Halaman dan Tombol
          Obx(
            () => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                children: [
                  // Indikator Halaman
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: controller.currentIndex.value == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: controller.currentIndex.value == index
                              ? AppColors.primaryGreen
                              : AppColors.greyMedium,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 24),
                  // Tombol Masuk
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      minimumSize: Size(double.infinity, 48),
                    ),
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: Text(
                      'Masuk',
                      style: AppTypography.bodyText.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  // Tombol Daftar
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primaryGreen),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      minimumSize: Size(double.infinity, 48),
                    ),
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    child: Text(
                      'Belum ada akun? Daftar dulu',
                      style: AppTypography.bodyText.copyWith(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Ketentuan Layanan dan Kebijakan Privasi
                  Text.rich(
                    TextSpan(
                      text: 'Dengan masuk atau mendaftar, kamu menyetujui ',
                      style: AppTypography.caption
                          .copyWith(color: AppColors.greyMedium),
                      children: [
                        TextSpan(
                          text: 'Ketentuan layanan ',
                          style: AppTypography.caption
                              .copyWith(color: AppColors.primaryBlue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigasi ke halaman Ketentuan Layanan
                            },
                        ),
                        TextSpan(
                          text: 'dan ',
                          style: AppTypography.caption
                              .copyWith(color: AppColors.greyMedium),
                        ),
                        TextSpan(
                          text: 'Kebijakan privasi',
                          style: AppTypography.caption
                              .copyWith(color: AppColors.primaryBlue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigasi ke halaman Kebijakan Privasi
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingSlide({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 280, height: 180), // Gambar lebih besar
          SizedBox(height: 20),
          Text(
            title,
            style: AppTypography.h1.copyWith(color: AppColors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            description,
            style: AppTypography.subhead2.copyWith(color: AppColors.greyMedium),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}