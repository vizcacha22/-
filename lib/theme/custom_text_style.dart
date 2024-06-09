import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get josefinSans {
    return copyWith(
      fontFamily: 'Josefin Sans',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Display text style
  static get displayMediumInterOnPrimary =>
    theme.textTheme.displayMedium!.inter.copyWith(
      color: theme.colorScheme.onPrimary,
      fontSize: 40.fSize,
      fontWeight: FontWeight.w400, 
    );

  static get displayMediumJosefinSansGray600 =>
      theme.textTheme.displayMedium!.josefinSans.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );
  static get displayMediumRed400 => theme.textTheme.displayMedium!.copyWith(
        color: appTheme.red400,
        fontWeight: FontWeight.w500,
      );
// Inter text style
  static get interOnPrimary => TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 128.fSize,
        fontWeight: FontWeight.w400,
      ).inter;
}
