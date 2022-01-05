import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/material.dart';

class ColorProvider {
  static Future<PaletteGenerator> updatePaletteGenerator(Image image) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(image.image, size: Size(200, 100));
    return paletteGenerator;
  }
}
