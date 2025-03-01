import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveSizes {
  /// ✅ **Font Size Scaling**
  static double? fontSize(BuildContext context, double baseSize) {
    return ResponsiveValue<double>(
      context,
      defaultValue: baseSize, // Mobile (default)
      conditionalValues: [
        Condition.equals(name: DESKTOP, value: baseSize * 1.5),
      ],
    ).value;
  }

  static double screenWidth(BuildContext context) =>
      ResponsiveBreakpoints.of(context).screenWidth;
}
