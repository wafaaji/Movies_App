import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movies_app/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GlassmorphicContainer(
      width: screenWidth,
      height: 80,
      borderRadius: 0,
      linearGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Constants.kWhiteColor.withOpacity(0.1),
          Constants.kWhiteColor.withOpacity(0.1),
        ],
      ),
      border: 0,
      blur: 30,
      borderGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Constants.kPinkColor,
          Constants.kGreenColor,
        ],
      ),
      child: BottomAppBar(
        color: Colors.transparent,
        notchMargin: 4,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Constants.kIconHome,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Constants.kIconPlayOnTv,
                ),
              ),
            ),
            const Expanded(
              child: Text(''),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Constants.kIconCategories,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Constants.kIconDownload,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
