import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static const _family = 'Manrope';

  static ThemeData light() => _build(Brightness.light, AppPalette.light);
  static ThemeData dark() => _build(Brightness.dark, AppPalette.dark);

  static ThemeData _build(Brightness brightness, AppPalette palette) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF0B1F3A),
      brightness: brightness,
      primary: isDark ? palette.teal : palette.navy,
      onPrimary: isDark ? palette.onNavy : Colors.white,
      secondary: palette.teal,
      onSecondary: isDark ? palette.navyDeep : Colors.white,
      surface: palette.surface,
      error: palette.danger,
    );

    final text = TextTheme(
      headlineMedium: _style(28, FontWeight.w700, palette.ink, -0.6, 1.15),
      titleLarge: _style(22, FontWeight.w700, palette.ink, -0.3, 1.25),
      titleMedium: _style(17, FontWeight.w600, palette.ink, -0.1, 1.3),
      titleSmall: _style(15, FontWeight.w600, palette.ink, 0, 1.3),
      bodyLarge: _style(16, FontWeight.w400, palette.ink, 0, 1.45),
      bodyMedium: _style(15, FontWeight.w400, palette.ink, 0, 1.4),
      bodySmall: _style(13, FontWeight.w500, palette.muted, 0.1, 1.35),
      labelLarge: _style(16, FontWeight.w600, palette.ink, 0, 1.2),
      labelMedium: _style(13, FontWeight.w600, palette.muted, 0.2, 1.2),
    );

    final radius = BorderRadius.circular(AppRadius.md);
    final border = OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: palette.line),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: palette.background,
      textTheme: text,
      fontFamily: _family,
      extensions: [palette],
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: palette.background,
        foregroundColor: palette.ink,
        centerTitle: false,
        titleTextStyle: text.titleLarge,
        systemOverlayStyle: isDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),
      dividerColor: palette.line,
      cardTheme: CardThemeData(
        color: palette.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          side: BorderSide(color: palette.line),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: palette.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: text.bodyMedium?.copyWith(color: palette.muted),
        labelStyle: text.bodySmall?.copyWith(color: palette.muted),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: palette.teal, width: 1.6),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: palette.danger),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: palette.danger, width: 1.6),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(64, 52),
          backgroundColor: isDark ? palette.teal : palette.navy,
          foregroundColor: isDark ? palette.navyDeep : Colors.white,
          disabledBackgroundColor: palette.surfaceMuted,
          disabledForegroundColor: palette.muted,
          elevation: 0,
          textStyle: _style(16, FontWeight.w600, Colors.white, 0, 1.2),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(64, 52),
          foregroundColor: palette.ink,
          side: BorderSide(color: palette.line),
          textStyle: _style(16, FontWeight.w600, palette.ink, 0, 1.2),
          shape: RoundedRectangleBorder(borderRadius: radius),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: palette.teal,
          textStyle: _style(15, FontWeight.w600, palette.teal, 0, 1.2),
          minimumSize: const Size(48, 48),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: palette.surface,
        selectedColor: palette.tealSoft,
        disabledColor: palette.surfaceMuted,
        side: BorderSide(color: palette.line),
        labelStyle: text.bodySmall?.copyWith(color: palette.ink),
        secondaryLabelStyle: text.bodySmall?.copyWith(color: palette.teal),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        showCheckmark: false,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 68,
        backgroundColor: palette.surface,
        indicatorColor: palette.tealSoft,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return _style(
            12,
            selected ? FontWeight.w700 : FontWeight.w500,
            selected ? palette.ink : palette.muted,
            0,
            1.1,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? palette.teal : palette.muted,
            size: 24,
          );
        }),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: palette.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: palette.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        showDragHandle: true,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark ? palette.surfaceMuted : palette.navy,
        contentTextStyle: _style(14, FontWeight.w500, Colors.white, 0, 1.3),
        shape: RoundedRectangleBorder(borderRadius: radius),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: palette.teal),
      dividerTheme: DividerThemeData(color: palette.line, thickness: 1),
    );
  }

  static TextStyle _style(
    double size,
    FontWeight weight,
    Color color,
    double spacing,
    double height,
  ) {
    return TextStyle(
      fontFamily: _family,
      fontSize: size,
      fontWeight: weight,
      color: color,
      letterSpacing: spacing,
      height: height,
    );
  }
}
