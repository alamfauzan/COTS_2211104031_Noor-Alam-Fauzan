import 'package:get/get.dart';

class LoginController extends GetxController {
  // Properti reaktif untuk nomor telepon
  var phoneNumber = ''.obs; // Deklarasi RxString

  // Properti reaktif untuk loading state
  var isLoading = false.obs;

  // Fungsi login
  void login() {
    if (phoneNumber.value.isNotEmpty) {
      isLoading.value = true;

      // Simulasi login (contoh)
      Future.delayed(Duration(seconds: 2), () {
        isLoading.value = false;
        Get.toNamed('/home'); // Navigasi ke halaman berikutnya
      });
    } else {
      Get.snackbar('Error', 'Phone number cannot be empty');
    }
  }
}