import 'package:flutter/material.dart';
import 'package:footbal_app/core/app_export.dart';
import 'package:footbal_app/data/models/quiz_result_model.dart';
import 'package:footbal_app/presentation/quiz_page/quiz_results_bloc/quiz_results_bloc.dart';

import '../../core/utils/result_message_helper.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class QuizPage extends StatefulWidget {
  const QuizPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<QuizPage> createState() => _QuizPageState();


}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 18.v,
          ),
          child: BlocProvider(
            create: (context) => QuizResultsBloc()..add(QuizResultsInitEvent()),
            child: BlocBuilder<QuizResultsBloc, QuizResultsState>(
              builder: (context, state) {
                if (state is QuizResultsEmptyState) {
                  return _buildEmptyList(context);
                } else if (state is QuizResultsLoadedState) {
                  return _buildResultsList(context, state);
                } else {
                  return Center(
                      child: Container(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator()));
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultsList(BuildContext context, QuizResultsLoadedState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              return _quizResultItem(context, state.results[index]);
            },
          ),
        ),
        CustomElevatedButton(
          text: 'Try Again',
          onPressed: () {
            NavigatorService.pushNamed(AppRoutes.quizScreen);
          },
        ),
      ],
    );
  }

  Widget _buildEmptyList(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 53,
        ),
        SizedBox(
          width: 223.h,
          child: Text(
            'Check how much you know\nabout football',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodyLargeGray700.copyWith(
              height: 1.25,
            ),
          ),
        ),
        Spacer(
          flex: 46,
        ),
        CustomElevatedButton(
          text: 'Start',
          onPressed: () async {
            await NavigatorService.pushNamed(AppRoutes.quizScreen);
            context.read<QuizResultsBloc>().add(QuizResultsInitEvent());
          },
        ),
      ],
    );
  }

  Widget _quizResultItem(BuildContext context, QuizResultModel result) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.v),
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.surface.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 43.v,
            ),
            child: Text(
              '${result.correctAnswerCount}/${result.totalQuestionsCount}',
              style: CustomTextStyles.bodyLargePrimary18,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 14.h,
                top: 7.v,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 222.h,
                    height: 40.v,
                    margin: EdgeInsets.only(right: 22.h),
                    child: Text(
                      ResultMessageHelper.format(result.correctAnswerCount,
                          result.totalQuestionsCount),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumGray700.copyWith(
                        height: 1.43,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      result.dateTime.format(),
                      style: CustomTextStyles.bodySmallInter11,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: 'Quiz',
      ),
      styleType: Style.bgFill,
    );
  }
}
