import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllahSvgWidget extends StatelessWidget {
  final String arabicName;
  final String spelling;
  final String translation;
  AllahSvgWidget({required this.arabicName, required this.spelling, required this.translation});

  @override
  Widget build(BuildContext context) {
    // Load the SVG template from assets
    final String svgTemplate = '''
      <svg width="300" height="300" xmlns="http://www.w3.org/2000/svg">
        <rect width="300" height="300" fill="antiquewhite" />
        <text id="arabic_name" x="50%" y="50%" text-anchor="middle" font-size="200" fill="black" font-family="'Amiri', serif">
          $arabicName
        </text>
        <text id="english_name" x="50%" y="60%" text-anchor="middle" font-size="30" fill="gray" font-family="'Arial', sans-serif">
          $spelling
        </text>
        <text id="translation" x="50%" y="75%" text-anchor="middle" font-size="20" fill="gray" font-family="'Arial', sans-serif">
          $translation
        </text>
      </svg>
    ''';

    return SvgPicture.string(svgTemplate, fit: BoxFit.fill);
  }
}
