import 'package:flutter/material.dart';
import 'package:footbal_app/core/app_export.dart';

class AppDecoration {
  // Accent decorations
  static BoxDecoration get accent => BoxDecoration(
        color: theme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black9003f,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );

  // Fill decorations
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.gray700,
            width: 1.h,
          ),
          bottom: BorderSide(
            color: appTheme.gray700,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineGray700 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray700,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineGray7001 => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray700,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.primary,
            width: 2.h,
          ),
        ),
      );

  // Surface decorations
  static BoxDecoration get surface => BoxDecoration(
        color: appTheme.gray300,
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder115 => BorderRadius.circular(
        115.h,
      );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder28 => BorderRadius.circular(
        28.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
