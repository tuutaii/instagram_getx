part of style;

class AppTheme {
  factory AppTheme() => _instance;

  AppTheme._internal();
  static final AppTheme _instance = AppTheme._internal();
  static const Color primary = Colors.blue;

  static ThemeData getCollectionTheme() {
    ColorScheme colorScheme = const ColorScheme.light(primary: primary);
    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.surface,
      errorColor: colorScheme.error,
      colorScheme: colorScheme,
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String? hexColor) {
    hexColor = hexColor ?? 'ffffff';
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String? hexColor) : super(_getColorFromHex(hexColor));
}
