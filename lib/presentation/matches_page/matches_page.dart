import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:footbal_app/core/app_export.dart';
import 'package:footbal_app/data/models/match_models/match_model.dart';
import 'package:footbal_app/presentation/matches_page/matches_bloc/matches_bloc.dart';

import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'widgets/match_ingame_card_widget.dart';
import 'widgets/match_upcoming_card_widget.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider<MatchesBloc>(
        create: (context) =>
            MatchesBloc(MatchesInitial())..add(MatchesInitEvent()),
        child: BlocBuilder<MatchesBloc, MatchesState>(
          builder: (context, state) {
            if (state is MatchesLoadedState) {
              return Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 4.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32.v),
                    _buildMatchCardSlider(context, state),
                    SizedBox(height: 37.v),
                    Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "msg_upcoming_matches".tr,
                        style: CustomTextStyles.bodyLarge18,
                      ),
                    ),
                    SizedBox(height: 10.v),
                    _buildMatchComponentList(context, state),
                  ],
                ),
              );
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
    );
  }

  Widget _buildMatchCardSlider(BuildContext context, MatchesLoadedState state) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 160.v,
        initialPage: 0,
        autoPlay: true,
        viewportFraction: 0.8,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
        disableCenter: true,
        onPageChanged: (
          index,
          reason,
        ) {},
      ),
      itemCount: state.inGameMathesList.length ?? 0,
      itemBuilder: (context, index, realIndex) {
        MatchModel model = state.inGameMathesList[index];
        return InkWell(
          onTap: () {
            NavigatorService.pushNamed(AppRoutes.matchDetailsScreen,
                arguments: [true, model]);
          },
          child: MatchIngameCardWidget(
            model,
          ),
        );
      },
    );
  }

  Widget _buildMatchComponentList(
      BuildContext context, MatchesLoadedState state) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 12.v,
            );
          },
          itemCount: state.upcomingMatchesList.length ?? 0,
          itemBuilder: (context, index) {
            MatchModel model = state.upcomingMatchesList[index];
            return InkWell(
              onTap: () {
                NavigatorService.pushNamed(AppRoutes.matchDetailsScreen,
                    arguments: [false, model]);
              },
              child: MatchUpcomingCardWidget(
                model,
              ),
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: 'Matches',
      ),
      styleType: Style.bgFill,
    );
  }
}
