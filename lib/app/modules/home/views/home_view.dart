import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Moving Square Box")),
      body: LayoutBuilder(builder: (context, constraints) {
        return Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TweenAnimationBuilder<Alignment>(
                duration: const Duration(seconds: 1),
                tween: AlignmentTween(
                    begin: controller.alignment.value,
                    end: controller.alignment.value),
                builder: (context, value, child) {
                  return SizedBox(
                    width: Get.width, // Full width
                    height: 100,
                    child: Align(
                      alignment: value,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(width: 100, height: 100, color: Colors.red),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                  onTap: () {
                    if (controller.isAnimating.value ||
                        controller.pos.value == position.LEFT) return;

                    controller.toggleAlignment(from: position.LEFT);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: controller.isAnimating.value ||
                              controller.pos.value == position.LEFT
                          ? Colors.grey[300]
                          : Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Left",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    if (controller.isAnimating.value ||
                        controller.pos.value == position.RIGHT) return;

                    controller.toggleAlignment(from: position.RIGHT);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: controller.isAnimating.value ||
                              controller.pos.value == position.RIGHT
                          ? Colors.grey[300]
                          : Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // onPressed: controller.toggleAlignment,
                    child: const Text(
                      "Right",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        );
      }),
    );
  }
}
