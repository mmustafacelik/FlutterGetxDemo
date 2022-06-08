import 'package:get/get.dart';

class SayacController extends GetxController {
  final _sayac = 0.obs;
  get sayac => _sayac.value;
  set sayac(value) => _sayac.value = value;

  void arttir() {
    sayac++;
  }

  void azalt() {
    sayac--;
  }
}
