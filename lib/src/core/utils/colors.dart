import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  double get w => MediaQuery.of(this).size.width;
  double get h => MediaQuery.of(this).size.height;
}

extension ColorExtension on Color {
  Color get primary => const Color(0xFF59867c); // Morado eléctrico
  Color get secondary => const Color(0xFF59867c); // Turquesa moderno
  Color get background => const Color(0xFF121212); // Negro suave (modo oscuro)
  Color get cardBackground => const Color(0xFF1E1E1E); // Gris oscuro elegante
  Color get textPrimary => const Color(0xFFFFFFFF); // Blanco puro
  Color get textSecondary => const Color(0xFFB3B3B3); // Gris claro
  Color get borderColor => const Color(0xFF292929); // Gris oscuro sutil
  Color get errorColor => const Color(0xFFFF5252); // Rojo vibrante
  Color get doneColor => const Color(0xFF00E676); // Verde neón
  Color get highPriorityColor => const Color(0xFFFF1744); // Rojo intenso
  Color get mediumPriorityColor => const Color(0xFFFF8F00); // Naranja cálido
  Color get lowPriorityColor => const Color(0xFF4CAF50); // Verde esmeralda
}
