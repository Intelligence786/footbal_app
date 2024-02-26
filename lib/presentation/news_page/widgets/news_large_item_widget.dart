
import 'package:flutter/material.dart';
import 'package:footbal_app/core/app_export.dart';
import 'package:intl/intl.dart';

import '../../../data/models/news_model.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class NewsLargeItemWidget extends StatelessWidget {
  NewsLargeItemWidget(
    this.newsModel, {
    Key? key,
  }) : super(
          key: key,
        );

  NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.newsViewScreen,
            arguments: newsModel);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.h,
          vertical: 7.v,
        ),
        decoration: AppDecoration.surface.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: newsModel.imgUrl ?? ImageConstant.imageNotFound,
              fit: BoxFit.fitHeight,
              height: 98.adaptSize,
              width: 98.adaptSize,
              radius: BorderRadius.circular(
                8.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 198.h,
                    child: Text(
                      newsModel.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        height: 1.25,
                      ),
                    ),
                  ),
                  SizedBox(height: 43.v),
                  Text(
                    newsModel.date?.format() ?? '',
                    style: CustomTextStyles.bodySmallInter,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
