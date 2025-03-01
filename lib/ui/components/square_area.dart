import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_square/controller/home_controller.dart';

class SquareArea extends StatelessWidget {
  final BoxConstraints constraints;

  SquareArea({super.key, required this.constraints});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: controller.animationDuration.value),
            curve: Curves.easeInOut,
            left: controller.position.value,
            top: constraints.maxHeight / 2 - controller.squareSize.value / 2,
            child: SizedBox(
              width: controller.squareSize.value,
              height: controller.squareSize.value,
              child: ColoredBox(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
