import 'package:flutter/material.dart';
import 'constant.dart';

class IconContent extends StatelessWidget {
  final iconDate;
  final String label;
  IconContent({
    required this.iconDate,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Icon(
            iconDate,
            size: 80.0,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 20.0,
          ),
        ),
        Expanded(
          child: Text(
            label,
            style: KTextSyle,
          ),
        )
      ],
    );
  }
}
