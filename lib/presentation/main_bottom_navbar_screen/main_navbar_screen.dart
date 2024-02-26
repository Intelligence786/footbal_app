import 'package:flutter/material.dart';
import 'package:footbal_app/core/app_export.dart';
import 'package:footbal_app/presentation/matches_page/matches_page.dart';
import 'package:footbal_app/presentation/news_page/news_page.dart';

import '../profile_page/profile_page.dart';
import '../quiz_page/quiz_page.dart';

class MainNavBarScreen extends StatefulWidget {
  final int selectedIndex;

  const MainNavBarScreen({super.key, this.selectedIndex = 0});

  static Widget builder(BuildContext context, {int selectedIndex = 0}) {
    return MainNavBarScreen(
      selectedIndex: selectedIndex,
    );
  }

  @override
  State<MainNavBarScreen> createState() => _MainNavBarScreenState();
}

class _MainNavBarScreenState extends State<MainNavBarScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MatchesPage(),
    NewsPage(),
    QuizPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: ImageConstant.imgNavMatchesGray700,
              color: appTheme.gray700,
            ),
            activeIcon: CustomImageView(
              imagePath: ImageConstant.imgNavMatches,
              color: theme.colorScheme.primary,
            ),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: ImageConstant.imgNavNews,
              color: appTheme.gray700,
            ),
            activeIcon: CustomImageView(
              imagePath: ImageConstant.imgNavNewsPrimary,
              color: theme.colorScheme.primary,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: ImageConstant.imgNavQuiz,
              color: appTheme.gray700,
            ),
            activeIcon: CustomImageView(
              imagePath: ImageConstant.imgNavQuizPrimary,
              color: theme.colorScheme.primary,
            ),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: ImageConstant.imgNavProfile,
              color: appTheme.gray700,
            ),
            activeIcon: CustomImageView(
              imagePath: ImageConstant.imgNavProfilePrimary,
              color: theme.colorScheme.primary,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: appTheme.gray700,
        onTap: _onItemTapped,
      ),
    );
  }
}
