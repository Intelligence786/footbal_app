import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_switch.dart';
import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';

// ignore_for_file: must_be_immutable
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return ProfilePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(
            ProfileState(
              profileModelObj: ProfileModel(),
            ),
          )..add(ProfileInitialEvent()),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 24.v,
            ),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse119,
                  height: 57.adaptSize,
                  width: 57.adaptSize,
                  radius: BorderRadius.circular(
                    28.h,
                  ),
                ),
                SizedBox(height: 17.v),
                Text(
                  "lbl_user_name".tr,
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(height: 12.v),
                Text(
                  "msg_username_gmail_com".tr,
                  style: CustomTextStyles.bodyMediumGray700,
                ),
                SizedBox(height: 24.v),
                CustomElevatedButton(
                  height: 34.v,
                  width: 178.h,
                  text: "lbl_edit".tr,
                  buttonStyle: CustomButtonStyles.fillPrimaryTL17,
                  buttonTextStyle: CustomTextStyles.bodyMediumOnPrimary,
                ),
                SizedBox(height: 54.v),
                _buildToggleRow(context),
                SizedBox(height: 20.v),
                _buildButton(
                    context, ImageConstant.imgPrivacy, 'Privacy policy', () {}),

                _buildButton(
                    context, ImageConstant.imgPaper, 'Terms of use', () {}),

                _buildButton(context, ImageConstant.imgRate, 'Rate app', () {}),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_profile".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  Widget _buildButton(
      BuildContext context, String iconPath, String text, Function? onTap) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 50,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),

        onTap: () {
          onTap?.call();
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              CustomImageView(
                imagePath: iconPath,
                height: 24.adaptSize,
                width: 24.adaptSize,
                color: appTheme.gray700,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  top: 4.v,
                  bottom: 2.v,
                ),
                child: Text(
                  text,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildToggleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgBell,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 3.v),
          color: appTheme.gray700,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            top: 6.v,
            bottom: 7.v,
          ),
          child: Text(
            "lbl_notification".tr,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        Spacer(),
        BlocSelector<ProfileBloc, ProfileState, bool?>(
          selector: (state) => state.isSelectedSwitch,
          builder: (context, isSelectedSwitch) {
            return CustomSwitch(
              value: isSelectedSwitch,
              onChange: (value) {
                context
                    .read<ProfileBloc>()
                    .add(ChangeSwitchEvent(value: value));
              },
            );
          },
        ),
      ],
    );
  }
}
