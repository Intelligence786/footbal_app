import 'package:flutter/material.dart';
import 'package:footbal_app/data/models/match_models/match_model.dart';
import 'package:footbal_app/presentation/main_bottom_navbar_screen/main_navbar_screen.dart';
import 'package:footbal_app/presentation/matches_page/matches_sub_screen/match_details_screen.dart';
import 'package:footbal_app/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:footbal_app/presentation/quiz_page/quiz_game_screen/quiz_game_screen.dart';

import '../data/models/news_model.dart';
import '../presentation/news_page/news_view_screen/news_view_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String newsViewScreen = '/news_view_screen';

  static const String quizScreen = '/quiz_screen';

  static const String matchDetailsScreen = '/match_details_screen';

  static const String mainNavbarScreen = '/main_navbar_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        onboardingScreen: OnboardingScreen.builder,
        mainNavbarScreen: (context) {
          final arguments =
              (ModalRoute.of(context)!.settings.arguments ?? 0) as int;
          return MainNavBarScreen.builder(context, selectedIndex: arguments);
        },
        newsViewScreen: (context) {
          final arguments =
              ModalRoute.of(context)!.settings.arguments as NewsModel;
          return NewsViewScreen.builder(context, arguments);
        },
        matchDetailsScreen: (context) {
          // Retrieve the arguments as a Map<String, int>
          final args =
              ModalRoute.of(context)!.settings.arguments as List<Object>;

          // Extract the values using the keys
          final bool inGame = args[0] as bool ;
          final MatchModel match = args[1] as MatchModel;

          // Pass the values to the TestResultScreen widget
          return MatchDetailsScreen(
            inGame: inGame ?? false,
            match: match,
          );
        },
        quizScreen: QuizGameScreen.builder,
      };
}
