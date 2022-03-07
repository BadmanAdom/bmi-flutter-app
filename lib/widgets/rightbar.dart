import 'package:flutter/material.dart';
import 'package:bmi/constants/constants.dart';

class RightBar extends StatelessWidget {
  final double barWidth;

  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .03,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: accentHex),
        )
      ],
    ));
  }
}
