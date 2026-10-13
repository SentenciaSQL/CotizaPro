import 'package:flutter/material.dart';

@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.navy,
    required this.navyDeep,
    required this.teal,
    required this.tealSoft,
    required this.background,
    required this.surface,
    required this.surfaceMuted,
    required this.ink,
    required this.muted,
    required this.line,
    required this.danger,
    required this.success,
    required this.warning,
    required this.info,
    required this.onNavy,
  });

  final Color navy;
  final Color navyDeep;
  final Color teal;
  final Color tealSoft;
  final Color background;
  final Color surface;
  final Color surfaceMuted;
  final Color ink;
  final Color muted;
  final Color line;
  final Color danger;
  final Color success;
  final Color warning;
  final Color info;
  final Color onNavy;

  static const light = AppPalette(
    navy: Color(0xFF0B1F3A),
    navyDeep: Color(0xFF071525),
    teal: Color(0xFF0E7C78),
    tealSoft: Color(0xFFE5F5F4),
    background: Color(0xFFF3F5F7),
    surface: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFEEF2F5),
    ink: Color(0xFF142033),
    muted: Color(0xFF5C6B7E),
    line: Color(0xFFE1E7EE),
    danger: Color(0xFFB4332E),
    success: Color(0xFF0D7A56),
    warning: Color(0xFF9A6208),
    info: Color(0xFF1D5FBF),
    onNavy: Color(0xFFFFFFFF),
  );

  static const dark = AppPalette(
    navy: Color(0xFFD5E4F7),
    navyDeep: Color(0xFF070C14),
    teal: Color(0xFF3DC4BE),
    tealSoft: Color(0xFF143330),
    background: Color(0xFF0B1018),
    surface: Color(0xFF151C28),
    surfaceMuted: Color(0xFF1C2634),
    ink: Color(0xFFE7EEF7),
    muted: Color(0xFF9AABBF),
    line: Color(0xFF2C384A),
    danger: Color(0xFFFF8D86),
    success: Color(0xFF4ECCA3),
    warning: Color(0xFFE6B15A),
    info: Color(0xFF8EB6F5),
    onNavy: Color(0xFF071525),
  );

  @override
  AppPalette copyWith({
    Color? navy,
    Color? navyDeep,
    Color? teal,
    Color? tealSoft,
    Color? background,
    Color? surface,
    Color? surfaceMuted,
    Color? ink,
    Color? muted,
    Color? line,
    Color? danger,
    Color? success,
    Color? warning,
    Color? info,
    Color? onNavy,
  }) {
    return AppPalette(
      navy: navy ?? this.navy,
      navyDeep: navyDeep ?? this.navyDeep,
      teal: teal ?? this.teal,
      tealSoft: tealSoft ?? this.tealSoft,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      ink: ink ?? this.ink,
      muted: muted ?? this.muted,
      line: line ?? this.line,
      danger: danger ?? this.danger,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      onNavy: onNavy ?? this.onNavy,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      navy: Color.lerp(navy, other.navy, t)!,
      navyDeep: Color.lerp(navyDeep, other.navyDeep, t)!,
      teal: Color.lerp(teal, other.teal, t)!,
      tealSoft: Color.lerp(tealSoft, other.tealSoft, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      line: Color.lerp(line, other.line, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onNavy: Color.lerp(onNavy, other.onNavy, t)!,
    );
  }
}

class AppSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
}

class AppRadius {
  static const double sm = 10;
  static const double md = 14;
  static const double lg = 18;
  static const double pill = 999;
}
