import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeGray700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLargePrimary18 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
      );
  static get bodyLargePrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 18.fSize,
      );
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 15.fSize,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 15.fSize,
      );
  static get bodyMediumff616161 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF616161),
      );
  static get bodySmallInter => theme.textTheme.bodySmall!.inter.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallInter11 => theme.textTheme.bodySmall!.inter.copyWith(
        fontSize: 11.fSize,
      );
  static get bodySmallInterOnPrimaryContainer =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 12.fSize,
      );
  static get bodySmallInterOnPrimaryContainer11 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(0.56),
        fontSize: 11.fSize,
      );
  static get bodySmallInterOnPrimaryContainer11_1 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 11.fSize,
      );
  static get bodySmallInterPrimaryContainer =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 12.fSize,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallff343434 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFF343434),
      );
  static get bodySmallff616161 => theme.textTheme.bodySmall!.copyWith(
        color: Color(0XFF616161),
      );
  // Inter text style
  static get interOnPrimary => TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 126.fSize,
        fontWeight: FontWeight.w700,
      ).inter;
  // Title text style
  static get titleLargeff343434 => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFF343434),
        fontSize: 20.fSize,
      );
  static get titleLargeff343434_1 => theme.textTheme.titleLarge!.copyWith(
        color: Color(0XFF343434),
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
