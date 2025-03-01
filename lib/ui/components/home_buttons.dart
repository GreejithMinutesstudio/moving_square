import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_square/controller/home_controller.dart';

class HomeButtons extends StatelessWidget {
  HomeButtons({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(
          () => ElevatedButton(
            onPressed:
                controller.isLeftDisabled
                    ? null
                    : () => controller.moveSquare(false),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios_rounded),
                SizedBox(width: 6,),
                const Text("Left"),
              ],
            ),
          ),
        ),
        Obx(
          () => ElevatedButton(
            onPressed:
                controller.isRightDisabled
                    ? null
                    : () => controller.moveSquare(true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Right"),
                SizedBox(width: 6,),
                Icon(Icons.arrow_forward_ios_rounded),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
