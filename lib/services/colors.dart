import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/material.dart';

extension ColorBrightness on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
    hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

class ColorProvider {
  static Future<Color> updatePaletteGenerator(Image image) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(image.image, size: Size(200, 100));
    return paletteGenerator.dominantColor!.color.darken(0.05);
  }
}
