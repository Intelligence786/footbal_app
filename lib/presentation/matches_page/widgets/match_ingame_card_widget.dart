import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../data/models/match_models/match_model.dart';

// ignore: must_be_immutable
class MatchIngameCardWidget extends StatelessWidget {
  MatchIngameCardWidget(
    this.matchModel, {
    Key? key,
  }) : super(
          key: key,
        );

  MatchModel matchModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        // horizontal: 43.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.accent.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              matchModel.league?.name ?? '',
              style: CustomTextStyles.bodySmallInterPrimaryContainer,
            ),
          ),
          SizedBox(height: 7.v),
          Text(
            '${matchModel.league?.leagueTeamsList.firstWhere((element) => element.team == matchModel.firstClub).overall}:${matchModel.league?.leagueTeamsList.firstWhere((element) => element.team == matchModel.secondClub).overall}',
            style: CustomTextStyles.bodySmallInterPrimaryContainer,
          ),
          SizedBox(height: 5.v),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img5491,
                        height: 45.adaptSize,
                        width: 45.adaptSize,
                      ),
                      SizedBox(height: 10.v),
                      Text(
                        matchModel.firstClub.name!,
                        style:
                            CustomTextStyles.bodySmallInterPrimaryContainer,
                      ),
                    ],
                  ),
                ),
                Text(
                  '${matchModel.firstClubScore} - ${matchModel.secondClubScore}',
                  style: CustomTextStyles.bodyLargePrimaryContainer,
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img5491,
                        height: 45.adaptSize,
                        width: 45.adaptSize,
                      ),
                      SizedBox(height: 10.v),
                      Text(
                        matchModel.secondClub.name!,
                        style:
                            CustomTextStyles.bodySmallInterPrimaryContainer,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 17.v),
        ],
      ),
    );
  }
}
