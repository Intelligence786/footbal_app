import 'package:flutter/material.dart';
import 'package:footbal_app/core/app_export.dart';
import 'package:footbal_app/data/models/match_models/league_model.dart';
import 'package:footbal_app/data/models/match_models/match_model.dart';
import 'package:footbal_app/presentation/matches_page/widgets/match_ingame_card_widget.dart';
import 'package:footbal_app/presentation/matches_page/widgets/match_upcoming_card_widget.dart';

import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';

class MatchDetailsScreen extends StatefulWidget {
  final bool inGame;
  final MatchModel match;

  const MatchDetailsScreen(
      {super.key, required this.inGame, required this.match});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List tabs;
  int _currentIndex = 0;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();

    tabs = ['Overview', 'Table'];
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_handleTabControllerTick);
  }

  void _handleTabControllerTick() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  _tabsContent() {
    if (_currentIndex == 0) {
      return _buildOverview(context);
    } else if (_currentIndex == 1) {
      return _buildTable(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        // width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          vertical: 4.v,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.v),
            Flexible(
              //height: 160.v,
              child: widget.inGame
                  ? Container(
                      height: 160.v,
                      margin: EdgeInsets.symmetric(horizontal: 30.h),
                      child: MatchIngameCardWidget(widget.match),
                    )
                  : Container(
                      height: 100.v,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: MatchUpcomingCardWidget(widget.match),
                    ),
            ),
            SizedBox(height: 37.v),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    child: TabBar(
                      indicatorColor: theme.colorScheme.primary,
                      labelColor: theme.colorScheme.primary,
                      labelStyle: theme.textTheme.bodyLarge,
                      unselectedLabelColor: appTheme.gray700,
                      controller: _tabController,
                      tabs: tabs.map((e) => Tab(text: e)).toList(),
                    ),
                  ),
                  _tabsContent(),
                ],
              ),
            ),

            /// Divider(),

            SizedBox(height: 10.v),
          ],
        ),
      ),
    );
  }

  Widget _buildOverview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable(
          decoration: AppDecoration.outlineGray,
          columnSpacing: 20,
          horizontalMargin: 10,
          dataRowMinHeight: 1,
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                '#', style: theme.textTheme.bodyLarge,
                //style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Team', style: theme.textTheme.bodyLarge,
                  //  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'G', style: theme.textTheme.bodyLarge,
                //  style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'T', style: theme.textTheme.bodyLarge,
                // style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'O', style: theme.textTheme.bodyLarge,
                // style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: List<DataRow>.generate(currentTeams(widget.match).length ?? 0,
              (int index) {
            List<LeagueTeam> currTeams = currentTeams(widget.match);
            return DataRow(
              cells: <DataCell>[
                DataCell(
                  Text(
                    '${index + 1}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                DataCell(
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CustomImageView(
                          height: 30,
                          imagePath: ImageConstant.img5491,
                        ),
                      ),
                      Text(
                        '${currTeams[index].team.name}',
                        style: theme.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                DataCell(
                  Text(
                    '${currTeams[index].gamesCount}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                DataCell(
                  Text(
                    '${currTeams[index].totalPoints}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                DataCell(
                  Text(
                    '${currTeams[index].overall}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 40,
                decoration: AppDecoration.surface
                    ?.copyWith(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Coefficients',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(
                      top: 8.v,
                      right: 8.h,
                    ),
                    child: _coefficientItem(
                      context,
                      '1',
                      1.4,
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: 8.v, left: 4.h, right: 4.h),
                    child: _coefficientItem(context, 'x', 1.4),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: 8.v, left: 8.h),
                    child: _coefficientItem(context, '2', 1.4),
                  )),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _coefficientItem(
      BuildContext context, String coefText, double coefValue) {
    return Container(
      height: 40,
      decoration: AppDecoration.surface
          ?.copyWith(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(coefText),
            //Flexible(child: Container()),
            Text(coefValue.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildTable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable(
          decoration: AppDecoration.outlineGray,
          columnSpacing: 20,
          horizontalMargin: 10,
          dataRowMinHeight: 1,
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                '#', style: theme.textTheme.bodyLarge,
                //style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Team',
                  style: theme.textTheme.bodyLarge,
                  //  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'G', style: theme.textTheme.bodyLarge,
                //  style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'T', style: theme.textTheme.bodyLarge,
                // style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'O', style: theme.textTheme.bodyLarge,
                // style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: List<DataRow>.generate(
              widget.match.league?.leagueTeamsList.length ?? 0, (int index) {
            List<LeagueTeam> currTeams = widget.match.league!.leagueTeamsList;
            return DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                // All rows will have the same selected color.

                if (currTeams[index].team == widget.match.firstClub || currTeams[index].team == widget.match.secondClub ) {
                  return AppDecoration.outlineGray7001.color;
                }
              /*  if (currTeams.any((element) =>
                    element.team.name == widget.match.firstClub.name)) {
                  return AppDecoration.outlineGray7001.color;
                } */
                // Even rows will have a grey color.

                return null; // Use default value for other states and odd rows.
              }),
              cells: <DataCell>[
                DataCell(
                  Text(
                    '${index + 1}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                DataCell(
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CustomImageView(
                          height: 30,
                          imagePath: ImageConstant.img5491,
                        ),
                      ),
                      Text(
                        '${currTeams[index].team.name}',
                        style: theme.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                DataCell(
                  Text(
                    '${currTeams[index].gamesCount}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                DataCell(
                  Text(
                    '${currTeams[index].totalPoints}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                DataCell(
                  Text(
                    '${currTeams[index].overall}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  List<LeagueTeam> currentTeams(MatchModel match) {
    List<LeagueTeam> teams = [];

    teams.add(match.league!.leagueTeamsList
        .firstWhere((element) => element.team == match.firstClub));
    teams.add(match.league!.leagueTeamsList
        .firstWhere((element) => element.team == match.secondClub));

    return teams;
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
      title: AppbarSubtitleOne(
        text: "Matches".tr,
        margin: EdgeInsets.only(left: 8.h),
      ),
    );
  }
}
