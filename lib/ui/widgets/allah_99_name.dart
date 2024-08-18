import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'allah_names.dart';

class Allah99Name extends StatefulWidget {
  const Allah99Name({super.key});

  @override
  State<Allah99Name> createState() => _Allah99NameState();
}

class _Allah99NameState extends State<Allah99Name> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: RepaintBoundary(
              key: _globalKey,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/book_back.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  AllahSvgWidget(
                    arabicName: 'الله',
                    spelling: 'Allah',
                    translation: 'Yagona iloh',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '99 Names of Allah',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                Text(
                  'Asma Al-Husna',
                  style: GoogleFonts.nunito(color: Colors.white),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _shareImage();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.share_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text(
                          ' Share',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _shareImage() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      final XFile xfile = XFile(file.path);

      Share.shareXFiles([xfile], text: 'Check out this SVG image!');
    } catch (e) {
      print(e.toString());
    }
  }
}
