import 'package:flutter/material.dart';
import 'package:footbal_app/data/models/match_models/match_model.dart';

import '../../../core/app_export.dart';

// ignore: must_be_immutable
class MatchUpcomingCardWidget extends StatelessWidget {
  MatchUpcomingCardWidget(
    this.matchModel, {
    Key? key,
  }) : super(
          key: key,
        );

  MatchModel matchModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 12.v,
        ),
        decoration: AppDecoration.surface.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    'DATE',
                    style: CustomTextStyles.bodySmallInterOnPrimaryContainer11,
                  ),
                ),
                SizedBox(height: 2.v),
                Text(
                  matchModel.matchStartDateTime!.formatAnother(),
                  style: CustomTextStyles.bodySmallInterOnPrimaryContainer11_1,
                ),
                SizedBox(height: 8.v),
                Opacity(
                  opacity: 0.6,
                  child: Text(
                    'TIME',
                    style: CustomTextStyles.bodySmallInterOnPrimaryContainer11,
                  ),
                ),
                SizedBox(height: 2.v),
                Text(
                  matchModel.matchStartDateTime!.time()!,
                  style: CustomTextStyles.bodySmallInterOnPrimaryContainer11_1,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 80.h,
                  padding: EdgeInsets.only(top: 13.v),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img5491,
                        height: 28.adaptSize,
                        width: 28.adaptSize,
                      ),
                      SizedBox(height: 12.v),
                      Text(
                        matchModel.firstClub.name!,
                        style: CustomTextStyles
                            .bodySmallInterOnPrimaryContainer11_1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 20.h,
                  child: Text(
                    'VS',
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodySmallInterOnPrimaryContainer,
                  ),
                ),
                Container(
                  width: 80.h,
                  padding: EdgeInsets.only(
                    top: 13.v,
                  ),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.img5491,
                        height: 28.adaptSize,
                        width: 28.adaptSize,
                      ),
                      SizedBox(height: 12.v),
                      Text(
                        matchModel.secondClub.name!,
                        style: CustomTextStyles
                            .bodySmallInterOnPrimaryContainer11_1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
