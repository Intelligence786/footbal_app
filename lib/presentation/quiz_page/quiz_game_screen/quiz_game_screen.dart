import 'package:flutter/material.dart';
import 'package:footbal_app/core/utils/result_message_helper.dart';
import 'package:footbal_app/presentation/quiz_page/quiz_game_screen/quiz_bloc/quiz_bloc.dart';
import 'package:footbal_app/presentation/quiz_page/quiz_results_bloc/quiz_results_bloc.dart';
import 'package:footbal_app/widgets/app_bar/custom_app_bar.dart';

import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_title.dart';
import '../../../widgets/custom_elevated_button.dart';

class QuizGameScreen extends StatefulWidget {
  const QuizGameScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<QuizBloc>(
        create: (context) =>
            QuizBloc(QuizInitialState())..add(QuizStartedEvent()),
        child: QuizGameScreen());
  }

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  int selectedAnswerIndex = -1; // Индекс выбранного ответа
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizLoadingState) {
          return CircularProgressIndicator();
        } else if (state is QuizOnProgressState) {
          return _buildGame(context, state);
        } else if (state is QuizResultsShowState) {
          return _buildResult(context, state);
        } else {
          return Center(child: Text('Something went wrong'));
        }
      },
    );
  }

  Widget _buildGame(BuildContext context, QuizOnProgressState state) {
    return Scaffold(
      appBar: _buildAppBar(context,
          '${state.currentQuestionIndex + 1}/${state.questions.length}'),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 21.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
                imagePath: state.currentQuestion.imageUrl,
                fit: BoxFit.cover,
                height: 200.v,
                width: 343.h,
                radius: BorderRadius.circular(8.h)),
            SizedBox(height: 19.v),
            Container(
                width: 333.h,
                margin: EdgeInsets.only(right: 8.h, left: 8.h),
                child: Text(state.currentQuestion.text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(height: 1.25))),
            SizedBox(height: 35.v),
            Column(
              children:
                  state.currentQuestion.answers.asMap().entries.map((entry) {
                int index = entry.key;
                String answer = entry.value;
                return ListTile(
                  title: Text(
                    answer,
                    textAlign: TextAlign.left,
                  ),
                  onTap: () => setState(() {
                    selectedAnswerIndex = index ?? -1;
                  }),
                  leading: Radio(
                    toggleable: false,
                    value: index,
                    groupValue: selectedAnswerIndex,
                    onChanged: (int? value) => {
                      setState(() {
                        selectedAnswerIndex = index ?? -1;
                      })
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
          margin: EdgeInsets.symmetric(horizontal: 16.h),
          text: "lbl_continuer".tr,
          isDisabled: selectedAnswerIndex == -1,
          onPressed: () {
            context
                .read<QuizBloc>()
                .add(QuizAnswerSubmittedEvent(selectedAnswerIndex));
            selectedAnswerIndex = -1;
            print(state.currentQuestionIndex);
          }),
    );
  }

  Widget _buildResult(BuildContext context, QuizResultsShowState state) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: AppbarTitle(
          text: 'Your Score',
        ),
        styleType: Style.bgFill,
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 23.v),
            Align(
              alignment: Alignment.center,
              child: Text(
                '${state.correctAnswers}/${state.totalAnswers}',
                style: theme.textTheme.displayMedium,
              ),
            ),
            SizedBox(height: 32.v),
            Text(
              ResultMessageHelper.format(
                  state.correctAnswers, state.totalAnswers),
              style: CustomTextStyles.bodyMediumGray700,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        text: "lbl_continuer".tr,
        onPressed: ()  {
          NavigatorService.goBack();
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, String actionText) {
    return CustomAppBar(
      height: 56.v,
      leadingWidth: 40.h,
      leading: Container(
        // decoration: AppDecoration.surface,
        child: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            // margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 16.v, right: 16.h),
            onTap: () {
              NavigatorService.goBack();
            }),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.h),
          child: Center(
            child: Text(
              actionText,
              style: CustomTextStyles.bodyLarge18,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
      styleType: Style.bgFill,
    );
  }
}
