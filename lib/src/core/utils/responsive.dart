import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  /// Dispositivos con ancho menor a 840 se consideran móviles
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 840;

  /// Entre 840 y 1399 se considera tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 840 && width < 1400;
  }

  /// A partir de 1400 en adelante es desktop
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1400;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}
