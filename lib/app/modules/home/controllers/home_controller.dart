import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum position { CENTE, LEFT, RIGHT }

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  Rx<Alignment> alignment = Rx(Alignment.center); // Start at center
  var isAnimating = false.obs;
  var pos = position.CENTE.obs;

  void toggleAlignment({from = position.CENTE}) {
    if (isAnimating.value) return; // Prevent multiple taps

    isAnimating.value = true;

    pos.value = from;
    alignment.value = alignment.value == Alignment.centerLeft
        ? Alignment.centerRight
        : (alignment.value == Alignment.centerRight
            ? Alignment.centerLeft
            : Alignment.centerRight);

    Future.delayed(const Duration(seconds: 1), () {
      isAnimating.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
