
import 'package:cots_2211104031_nooralamfauzan/modules/login/bindings/login_bindings.dart';
import 'package:cots_2211104031_nooralamfauzan/modules/login/login_screen.dart';
import 'package:cots_2211104031_nooralamfauzan/modules/onboarding/bindings/onboarding_bindings.dart';
import 'package:cots_2211104031_nooralamfauzan/modules/onboarding/onboarding_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/onboarding',
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBindings(),
      ),
    // Tambahkan halaman lain di sini
  ];
}