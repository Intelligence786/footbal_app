import 'package:flutter/material.dart';
import 'package:footbal_app/core/app_export.dart';
import 'package:footbal_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:intl/intl.dart';

import '../../../data/models/news_model.dart';
import '../../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';

class NewsViewScreen extends StatelessWidget {
  final NewsModel newsModel;

  NewsViewScreen({Key? key, required this.newsModel})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context, NewsModel newsModel) {
    return NewsViewScreen(
      newsModel: newsModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    right: 16.h,
                    bottom: 5.v,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  SizedBox(height: 16.v),
                      CustomImageView(
                        fit: BoxFit.cover,
                        imagePath: newsModel.imgUrl,
                        height: 200.v,
                        width: 358.h,
                        radius: BorderRadius.circular(
                          16.h,
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Container(
                        width: double.infinity,
                        //decoration: AppDecoration.fillOnPrimaryContainer,
                        child: Text(
                          DateFormat('MMM dd, yyyy H:mm')
                              .format(newsModel.date ?? DateTime.now()),
                          style: CustomTextStyles
                              .bodySmallInterOnPrimaryContainer11,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Container(
                        // width: 334.h,
                        //margin: EdgeInsets.only(right: 23.h),
                        child: Text(newsModel.title ?? '',
                            // maxLines: 3,
                            overflow: TextOverflow.visible,
                            style: theme.textTheme.titleLarge),
                      ),
                      SizedBox(height: 16.v),
                      SizedBox(
                        //width: 354.h,
                        child: Text(newsModel.body ?? '',
                            //maxLines: 27,
                            overflow: TextOverflow.visible,
                            style: theme.textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
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
              onTapArrowLeft(context);
            }),
      ),
      title: AppbarSubtitleOne(
        text: "Back".tr,
        margin: EdgeInsets.only(left: 8.h),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
