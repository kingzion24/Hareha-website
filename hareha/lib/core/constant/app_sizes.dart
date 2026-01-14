class AppSizes {
  // Spacing (8px base system)
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xl2 = 48.0;
  static const double xl3 = 64.0;
  static const double xl4 = 96.0;
  static const double xl5 = 128.0;
  
  // Border Radius
  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;
  static const double radiusFull = 999.0;
  
  // Container Widths
  static const double maxWidthSm = 640.0;
  static const double maxWidthMd = 768.0;
  static const double maxWidthLg = 1024.0;
  static const double maxWidthXl = 1280.0;
  static const double maxWidth2xl = 1536.0;
  
  // Breakpoints
  static const double breakpointMobile = 640.0;
  static const double breakpointTablet = 768.0;
  static const double breakpointDesktop = 1024.0;
  static const double breakpointLargeDesktop = 1280.0;
  
  // Icon Sizes
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;
  
  // Button Heights
  static const double buttonHeightSm = 36.0;
  static const double buttonHeightMd = 44.0;
  static const double buttonHeightLg = 52.0;
  
  // AppBar
  static const double appBarHeight = 64.0;
  static const double appBarHeightMobile = 56.0;
  
  // Footer
  static const double footerHeight = 200.0;
  
  // Section Padding
  static double sectionPaddingVertical(double screenWidth) {
    if (screenWidth < breakpointMobile) return xl3;
    if (screenWidth < breakpointDesktop) return xl4;
    return xl5;
  }
  
  static double sectionPaddingHorizontal(double screenWidth) {
    if (screenWidth < breakpointMobile) return md;
    if (screenWidth < breakpointTablet) return lg;
    if (screenWidth < breakpointDesktop) return xl;
    return xl2;
  }
  
  // Container Max Width
  static double containerMaxWidth(double screenWidth) {
    if (screenWidth < breakpointDesktop) return screenWidth;
    return maxWidthXl;
  }
}