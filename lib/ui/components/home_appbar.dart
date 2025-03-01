import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_square/controller/home_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {

   HomeAppBar({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        double fontSize = controller.screenWidth.value * 0.04;
        // Clamp font size between 16 and 24
        fontSize = fontSize.clamp(16.0, 24.0);
        return AppBar(
          centerTitle: true,
          title: Text(
            "Moving Square",
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
