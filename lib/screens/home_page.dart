import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/components/masked_image.dart';
import 'package:movies_app/components/search_field_widget.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/screens/widgets/custom_bottom_navigation_bar.dart';
import 'package:movies_app/screens/widgets/custom_floatind_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    Widget _buildTopLeftGreenEffect(){
      return  Positioned(
        top: -100,
        left: -100,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Constants.kGreenColor.withOpacity(0.5),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 200,
              sigmaY: 200,
            ),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.transparent,
            ),
          ),
        ),
      );
    }

    Widget _buildRightPinkEffect(){
      return Positioned(
        top: screenHight * 0.4,
        right: -88,
        child: Container(
          height: 166,
          width: 166,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Constants.kPinkColor.withOpacity(0.5),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 200,
              sigmaY: 200,
            ),
            child: Container(
              height: 166,
              width: 166,
              color: Colors.transparent,
            ),
          ),
        ),
      );
    }

    Widget _buildBottomLeftGreenEffect(){
      return  Positioned(
        bottom: -100,
        left: -100,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Constants.kCyanColor.withOpacity(0.5),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 200,
              sigmaY: 200,
            ),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.transparent,
            ),
          ),
        ),
      );
    }

    Widget _buildPopularMoviesList(){
      return  SizedBox(
        height: 160,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: newMovies.length,
          itemBuilder: ((context, index) {
            String mask;
            if (index == 0) {
              mask = Constants.kMaskFirstIndex;
            } else if (index == newMovies.length - 1) {
              mask = Constants.kMaskLastIndex;
            } else {
              mask = Constants.kMaskCenter;
            }
            return GestureDetector(
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                height: 160,
                width: 142,
                child: MaskedImage(
                  asset: newMovies[index].moviePoster,
                  mask: mask,
                ),
              ),
            );
          }),
        ),
      );
    }

    Widget _buildUpcomingMoviesList(){
      return SizedBox(
        height: 160,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: upcomingMovies.length,
          itemBuilder: (context, index) {
            String mask;
            if (index == 0) {
              mask = Constants.kMaskFirstIndex;
            } else if (index == upcomingMovies.length - 1) {
              mask = Constants.kMaskLastIndex;
            } else {
              mask = Constants.kMaskCenter;
            }
            return GestureDetector(
              child: Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                ),
                height: 160,
                width: 142,
                child: MaskedImage(
                  asset: upcomingMovies[index].moviePoster,
                  mask: mask,
                ),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: SizedBox(
        height: screenHight,
        width: screenWidth,
        child: Stack(
          children: [
            // Green color top left
            _buildTopLeftGreenEffect(),
            // Pink color right
            _buildRightPinkEffect(),
            // Green color bottom left
            _buildBottomLeftGreenEffect(),
            SafeArea(
              bottom: false,
              child: ListView(
                primary: true,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'What would you\nlike to watch?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Constants.kWhiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SearchFieldWidget(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  const SizedBox(
                    height: 39,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Popular movies',
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  _buildPopularMoviesList(),
                  const SizedBox(
                    height: 39,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Upcoming movies',
                      style: TextStyle(
                        color: Constants.kWhiteColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  _buildUpcomingMoviesList(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
