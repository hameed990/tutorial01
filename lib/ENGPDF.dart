import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewerFromAsset extends StatelessWidget {
  const PDFViewerFromAsset({Key? key, required this.pdfAssetPath})
      : super(key: key);
  final String pdfAssetPath;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: const PDF(
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: false,
          ).fromAsset(
            pdfAssetPath,
          ),
        ),
      ),
    );
  }
}