import 'package:flutter/material.dart';
import 'package:barber/core/common/enums/layout_types.dart';

/// An extension method that adds the `isMobile`, `isTablet`, and `isDesktop` properties to the
/// `BoxConstraints` class.
extension ResponsiveConstraint on BoxConstraints {
  bool get isMobile => biggest.shortestSide < 00;
  bool get isTablet => biggest.longestSide >= 600 && biggest.longestSide < 900;
  bool get isDesktop =>
      biggest.longestSide >= 1000 && biggest.shortestSide > 650;

  LayoutTypes get layout => isMobile
      ? LayoutTypes.mobile
      : !isDesktop
          ? LayoutTypes.tablet
          : LayoutTypes.desktop;

  double get scale {
    if (isDesktop) {
      return 1.25;
    } else if (isTablet) {
      return 1.15;
    } else {
      return 1;
    }
  }
}
