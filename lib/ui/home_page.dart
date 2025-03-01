import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moving_square/controller/home_controller.dart';
import 'package:moving_square/ui/components/home_buttons.dart';
import 'components/home_appbar.dart';
import 'components/square_area.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateScreenWidth(constraints.maxWidth);

        return  Scaffold(
          appBar: HomeAppBar(),
          body: Column(
            children: [
              Expanded(child: SquareArea(constraints: constraints)),
              HomeButtons(),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
