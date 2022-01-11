import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function? onPress;

  ResuableCard({
    required this.colour,
    required this.cardChild,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress!();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: colour),
      ),
    );
  }
}
