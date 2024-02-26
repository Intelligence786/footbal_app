import 'package:footbal_app/core/app_export.dart';
import 'package:footbal_app/data/data_manager.dart';
import 'package:footbal_app/data/models/quiz_result_model.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/question_model.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc(QuizState initialState) : super(initialState) {
    on<QuizStartedEvent>(_onInitialize);
    on<QuizAnswerSubmittedEvent>(_onAnswerSubmittedToState);
  }

  _onInitialize(
    QuizStartedEvent event,
    Emitter<QuizState> emit,
  ) async {
    emit(QuizLoadingState());

    List<Question> questionsList = [
      Question(
        imageUrl:
            'https://w0.peakpx.com/wallpaper/694/864/HD-wallpaper-football-goal-soccer-ball-soccer-field-stadium-concepts-football-thumbnail.jpg',
        text: 'Which country won the first FIFA World Cup in 1930?',
        answers: [
          'Spain',
          'Argentina',
          'Uruguay',
        ],
        correctAnswer: 2,
      ),
      Question(
        imageUrl:
            'https://w0.peakpx.com/wallpaper/312/505/HD-wallpaper-uefa-champions-league-football-stadium-thumbnail.jpg',
        text:
            'Who holds the record for the most goals scored in FIFA World Cup history?',
        answers: [
          'Cristiano Ronaldo',
          'Lionel Messi',
          'Pelé',
        ],
        correctAnswer: 2,
      ),
      Question(
        imageUrl: 'https://w0.peakpx.com/wallpaper/231/327/HD-wallpaper-soccer-ball-net-goal-football-football-stadium-thumbnail.jpg',
        text:
            'In which year was FIFA (International Federation of Association Football) founded?',
        answers: [
          '1904',
          '1920',
          '1945',
        ],
        correctAnswer: 0,
      ),
      Question(
        imageUrl: 'https://w0.peakpx.com/wallpaper/812/952/HD-wallpaper-soccer-art-creative-football-ball-thumbnail.jpg',
        text: 'Which team won the 2018 FIFA World Cup?',
        answers: [
          'France',
          'Argentina',
          'Germany',
        ],
        correctAnswer: 0,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/177/456/10/sport-stadium-football-wallpaper-preview.jpg',
        text:
            'Who was the coach of the German national team during the 2014 FIFA World Cup?',
        answers: [
          'Joachim Löw',
          'Jurgen Klopp',
          'Pep Guardiola',
        ],
        correctAnswer: 0,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/837/385/136/barcelona-fc-barcelona-stadium-camp-nou-wallpaper-preview.jpg',
        text: 'In which city is the Santiago Bernabéu Stadium located?',
        answers: [
          'Milan',
          'Barcelona',
          'Madrid',
        ],
        correctAnswer: 2,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/911/928/871/football-stadium-stadium-manchester-united-wallpaper-preview.jpg',
        text:
            'Which team won the UEFA Champions League in the 2019/2020 season?',
        answers: [
          'Bayern Munich',
          'Liverpool',
          'Real Madrid',
        ],
        correctAnswer: 0,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/323/248/57/champions-champions-league-football-uefa-wallpaper-preview.jpg',
        text:
            'Which player was awarded the Ballon d\'Or for the best footballer in the world in 2019?',
        answers: [
          'Lionel Messi',
          'Cristiano Ronaldo',
          'Neymar',
        ],
        correctAnswer: 0,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/320/39/586/club-club-barca-goal-wallpaper-preview.jpg',
        text:
            'Who is the all-time top scorer in the history of the UEFA Champions League?',
        answers: [
          'Lionel Messi',
          'Cristiano Ronaldo',
          'Raúl',
        ],
        correctAnswer: 1,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/956/865/266/football-player-jump-wallpaper-preview.jpg',
        text:
            'What is the name of the trophy awarded to the winner of the UEFA Champions League?',
        answers: [
          'FIFA World Cup',
          'Ballon d\'Or',
          'UEFA Champions League Trophy',
        ],
        correctAnswer: 2,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/911/928/871/football-stadium-stadium-manchester-united-wallpaper-preview.jpg',
        text:
            'In which year was the UEFA European Championship (Euro) first held?',
        answers: [
          '1960',
          '1976',
          '1984',
        ],
        correctAnswer: 0,
      ),
      Question(
        imageUrl: 'https://c1.wallpaperflare.com/preview/504/196/46/old-trafford-manchester-united-stadium-stadion.jpg',
        text:
            'Which football club holds the record for the most UEFA Champions League titles won?',
        answers: [
          'Real Madrid',
          'Barcelona',
          'Bayern Munich',
        ],
        correctAnswer: 0,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/819/699/581/cristiano-ronaldo-real-madrid-wallpaper-2014-wallpaper-preview.jpg',
        text: 'Who is the all-time top scorer for the Brazil national team?',
        answers: [
          'Pelé',
          'Ronaldo',
          'Romário',
        ],
        correctAnswer: 0,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/239/747/591/earth-the-world-earth-carbon-wallpaper-preview.jpg',
        text: 'Which country hosted the FIFA World Cup in 2010?',
        answers: [
          'Germany',
          'South Africa',
          'Brazil',
        ],
        correctAnswer: 1,
      ),
      Question(
        imageUrl: 'https://c4.wallpaperflare.com/wallpaper/355/540/1004/sport-stadium-football-wallpaper-preview.jpg',
        text: 'Which player is nicknamed the "King of Football"?',
        answers: [
          'Diego Maradona',
          'Pelé',
          'Zinedine Zidane',
        ],
        correctAnswer: 1,
      ),
    ];

    emit(QuizOnProgressState(questionsList, questionsList[0], 0, 0));
  }

  _onAnswerSubmittedToState(
    QuizAnswerSubmittedEvent event,
    Emitter<QuizState> emit,
  ) async {
    int correctAnswers = (state as QuizOnProgressState).correctAnswerCount;
    int questionIndex = (state as QuizOnProgressState).currentQuestionIndex;
    final questions = (state as QuizOnProgressState).questions;
    final question = (state as QuizOnProgressState).currentQuestion;
    final isCorrect = question.correctAnswer == event.answerIndex;

    if (isCorrect) {
      correctAnswers++;
    }

    questionIndex++;

    if (questionIndex < questions.length) {
      emit(QuizOnProgressState(
          questions, questions[questionIndex], questionIndex, correctAnswers));
    } else {
      QuizResultModel result = QuizResultModel(
          correctAnswerCount: correctAnswers,
          totalQuestionsCount: questions.length,
          dateTime: DateTime.now());
      await DataManager.writeResult(result);
      emit(QuizResultsShowState(correctAnswers, questions.length));
    }
  }
}
