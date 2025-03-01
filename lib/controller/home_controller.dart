import 'package:get/get.dart';
import 'dart:async';

class HomeController extends GetxController {
  var position = 0.0.obs;
  var screenWidth = 0.0.obs;
  var squareSize = 50.0.obs;
  var isAnimating = false.obs;
  var animationDuration = 1.obs;

  /// Initialize square position at the center
  void updateScreenWidth(double width) {
    double oldWidth = screenWidth.value;
    double oldPosition = position.value;

    screenWidth.value = width;
    squareSize.value = screenWidth.value * 0.1; // Make square size responsive

    // If oldWidth is 0, it's the first time setting up the screen.
    if (oldWidth == 0) {
      position.value =
          (screenWidth.value - squareSize.value) / 2; // Center it initially
    } else {
      // Disable animation when screen size changes
      animationDuration.value = 0;

      // Preserve proportional position
      double proportion = oldPosition / oldWidth;
      position.value = proportion * screenWidth.value;

      // Ensure it doesn't exceed right edge
      if (position.value + squareSize.value > screenWidth.value) {
        position.value = screenWidth.value - squareSize.value;
      }

      // Re-enable animation after a short delay
      Future.delayed(Duration(milliseconds: 100), () {
        animationDuration.value = 1; // Restore 1-second animation for movement
      });
    }
  }

  /// Move the square left or right with animation
  // Future<void> moveSquare(bool toRight) async {
  //   if (isAnimating.value) return;
  //   isAnimating.value = true;
  //   animationDuration.value = 1; // Enable animation for movement
  //
  //   double targetPosition = toRight ? screenWidth.value - squareSize.value : 0;
  //   double step = (targetPosition - position.value).abs() / 50;
  //
  //   Timer.periodic(const Duration(milliseconds: 10), (timer) {
  //     if ((toRight && position.value >= targetPosition) ||
  //         (!toRight && position.value <= targetPosition)) {
  //       position.value = targetPosition;
  //       isAnimating.value = false;
  //       timer.cancel();
  //     } else {
  //       position.value += toRight ? step : -step;
  //     }
  //   });
  // }
  Future<void> moveSquare(bool toRight) async {
    if (isAnimating.value) return; // Prevent multiple taps
    isAnimating.value = true;

    double targetPosition = toRight ? screenWidth.value - squareSize.value : 0;

    // Animate to the new position
    position.value = targetPosition;

    // Wait for animation to complete before enabling buttons again
    await Future.delayed(const Duration(seconds: 1));

    isAnimating.value = false;
  }

  bool get isLeftDisabled => isAnimating.value || position.value <= 0;

  bool get isRightDisabled =>
      isAnimating.value ||
      position.value >= screenWidth.value - squareSize.value;

  // /// Check if Left button should be disabled
  // bool get isLeftDisabled => position.value <= 0 || isAnimating.value;
  //
  // /// Check if Right button should be disabled
  // bool get isRightDisabled =>
  //     position.value >= screenWidth.value - squareSize.value ||
  //     isAnimating.value;
}
