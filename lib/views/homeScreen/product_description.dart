import 'package:api_crud_practice/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../themes/text_theme.dart';

class ProductDescription extends StatelessWidget {
  final String text;
  final int? maxLines;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const ProductDescription({super.key, required this.text,this.maxLines, required this.color, required this.fontSize, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Wrap(
        children: [
          Text(
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            text,
            style: TextThemes.getTextStyle(
                fontSize: fontSize, fontWeight: fontWeight, color: color),
          )
        ],
      ),
    );
  }
}
