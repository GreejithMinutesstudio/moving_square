import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_square/controller/home_controller.dart';
import 'package:moving_square/ui/components/home_buttons.dart';

import '../constants/app_theme.dart';
import '../utils/responsive_sizes.dart';
import 'components/square_area.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Moving Square",
          style: appTheme.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontSize: ResponsiveSizes.fontSize(context, 20),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateScreenWidth(
            constraints.maxWidth,
          ); // Only updates when width changes
          return Column(
            children: [
              Expanded(child: SquareArea(constraints: constraints)),
              HomeButtons(),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
