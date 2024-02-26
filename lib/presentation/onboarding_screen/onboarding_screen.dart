import 'package:flutter/material.dart';
import 'package:footbal_app/core/app_export.dart';
import 'package:footbal_app/widgets/custom_elevated_button.dart';
import 'package:footbal_app/widgets/custom_segmented_progress_bar.dart';

class OnboardingScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return OnboardingScreen();
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  PageController pageController = PageController();

  List<Map<String, String>> onboardingData = [
    {
      'image': ImageConstant.imgFauzanSaariAm,
      'headText': 'Match Predictions',
      'bodyText':
          'View upcoming matches, select your favorites, and\nget detailed information.'
    },
    {
      'image': ImageConstant.imgSvenKucinicZ0,
      'headText': 'Football News',
      'bodyText': 'Read the latest news from the world of football.'
    },
    {
      'image': ImageConstant.imgRishabhSharma,
      'headText': 'Football Quiz',
      'bodyText':
          'Test your football knowledge by answering questions\nof various difficulty levels.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 30.v,
        //width: 350.h,
        color: Colors.transparent,
        child: InkWell(
          child: Center(
            child: Text(
              'Terms of use | Privacy Policy',
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {},
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350.v,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => CustomImageView(
                imagePath: onboardingData[index]['image'] ?? '',
              ),
            ),
          ),
          SizedBox(
            height: 60.v,
            child: CustomSegmentedProgressBar(
                count: onboardingData.length, index: currentPage),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 60.v,
              child: Text(
                onboardingData[currentPage]['headText'] ?? '',
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 50.v,
            child: Text(
              onboardingData[currentPage]['bodyText'] ?? '',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.v, horizontal: 10.h),
            child: SizedBox(
              height: 50.v,
              child: CustomElevatedButton(
                text: 'Continuer',
                onPressed: () {
                  if (currentPage == onboardingData.length - 1) {
                    Navigator.pushNamed(context, AppRoutes.mainNavbarScreen,
                        arguments: 0);
                  } else {
                    // Переход на следующую стадию
                    pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
