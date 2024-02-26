class ResultMessageHelper {
  static String format(int correctAnswers, int totalQuestions) {
    if (correctAnswers == totalQuestions) {
      return 'You have successfully answered all the questions, way to go!';
    } else if (correctAnswers > totalQuestions / 2) {
      return 'You have a good grasp of the basics!';
    }

    return 'You`ll definitely make it next time';
  }
}
