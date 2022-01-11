import 'package:flutter/material.dart';
import 'constant.dart';

class Calculation extends StatelessWidget {
  final Function nav;
  final String cal;
  Calculation({required this.cal, required this.nav});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nav();
      },
      child: Container(
        child: Center(
          child: Text(
            cal,
            style: KTextSyleCal,
          ),
        ),
        color: Color(0xFFEB1555),
        height: bottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
      ),
    );
  }
}
