import 'package:flutter/material.dart';
import '../../core/constant/app_sizes.dart';
import '../../core/utils/responsive.dart';

/// A container that adapts its layout based on screen size
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final bool addHorizontalPadding;
  final bool addVerticalPadding;
  final bool constrainWidth;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? customPadding;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.addHorizontalPadding = true,
    this.addVerticalPadding = true,
    this.constrainWidth = true,
    this.backgroundColor,
    this.customPadding,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: Center(
        child: Container(
          constraints: constrainWidth
              ? BoxConstraints(maxWidth: responsive.maxContainerWidth)
              : null,
          padding: customPadding ??
              EdgeInsets.symmetric(
                horizontal: addHorizontalPadding ? responsive.horizontalPadding : 0,
                vertical: addVerticalPadding ? responsive.verticalPadding : 0,
              ),
          child: child,
        ),
      ),
    );
  }
}

/// A responsive row that becomes a column on mobile
class ResponsiveRowColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;
  final bool reverseOnMobile;

  const ResponsiveRowColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.spacing = AppSizes.lg,
    this.reverseOnMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final effectiveChildren = responsive.isMobile && reverseOnMobile
        ? children.reversed.toList()
        : children;

    if (responsive.isMobile) {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: _addSpacing(effectiveChildren, spacing),
      );
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: _addSpacing(effectiveChildren, spacing),
    );
  }

  List<Widget> _addSpacing(List<Widget> children, double spacing) {
    if (children.isEmpty) return children;

    final spacedChildren = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(SizedBox(
          width: spacing,
          height: spacing,
        ));
      }
    }
    return spacedChildren;
  }
}

/// A grid that adapts its column count based on screen size
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final double? childAspectRatio;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.spacing = AppSizes.lg,
    this.runSpacing = AppSizes.lg,
    this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: responsive.gridColumns(),
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio ?? (responsive.isMobile ? 1.2 : 1.1),
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}