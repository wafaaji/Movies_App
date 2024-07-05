import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Constants.kPinkColor.withOpacity(0.2),
            Constants.kGreenColor.withOpacity(0.2)
          ],
        ),
      ),
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor,
              Constants.kGreenColor,
            ],
          ),
        ),
        child: RawMaterialButton(
          onPressed: () {},
          shape: const CircleBorder(),
          fillColor: const Color(0xff404c57),
          child: SvgPicture.asset(Constants.kIconPlus),
        ),
      ),
    );
  }
}
