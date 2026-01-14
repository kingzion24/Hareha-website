import 'package:flutter/material.dart';
import '../constant/app_sizes.dart';

class Responsive {
  final BuildContext context;
  
  Responsive(this.context);
  
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  
  bool get isMobile => width < AppSizes.breakpointMobile;
  bool get isTablet => width >= AppSizes.breakpointMobile && width < AppSizes.breakpointDesktop;
  bool get isDesktop => width >= AppSizes.breakpointDesktop;
  bool get isLargeDesktop => width >= AppSizes.breakpointLargeDesktop;
  
  double get horizontalPadding => AppSizes.sectionPaddingHorizontal(width);
  double get verticalPadding => AppSizes.sectionPaddingVertical(width);
  double get maxContainerWidth => AppSizes.containerMaxWidth(width);
  
  // Responsive value helper
  T value<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }
  
  // Grid columns helper
  int gridColumns() {
    if (isMobile) return 1;
    if (isTablet) return 2;
    return 3;
  }
  
  // Spacing helpers
  double spacing() {
    if (isMobile) return AppSizes.md;
    if (isTablet) return AppSizes.lg;
    return AppSizes.xl;
  }
}

// Extension for easier access
extension ResponsiveExtension on BuildContext {
  Responsive get responsive => Responsive(this);
}