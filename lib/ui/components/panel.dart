import 'package:flutter/material.dart';
import 'package:barber/core/common/constants/app_colors.dart';
import 'package:barber/ui/components/shimed_box.dart';

class Panel extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? child;
  final double? width;
  final double? height;
  final bool withShadow;
  final bool isLoading;
  final Border? border;
  final Color? color;
  final Function()? onTap;
  final Function()? onLongPress;
  final bool? clickable;

  const Panel({
    super.key,
    this.padding = const EdgeInsets.all(20),
    this.child,
    this.withShadow = true,
    this.isLoading = false,
    this.width,
    this.height,
    this.border,
    this.onTap,
    this.onLongPress,
    this.clickable,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ShimmedBox(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
      );
    }

    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        border: border,
        boxShadow: withShadow
            ? [
                BoxShadow(
                  color: AppColors.black_medium.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            : [],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: color ?? AppColors.shape,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          splashColor: AppColors.primary,
          overlayColor: MaterialStateProperty.all<Color>(
            AppColors.primary.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
