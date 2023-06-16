import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barber/core/common/constants/app_colors.dart';
import 'package:barber/core/common/extensions/context_extension.dart';
import 'package:barber/core/common/utils/custom_dialog_utils.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    this.showBackButton = true,
    this.onBack,
    this.backText,
    required this.child,
    this.bottom,
    this.top,
    this.topSize = 30,
    this.bottomSize = 30,
    this.dimissAction,
  });

  final bool showBackButton;
  final String? backText;
  final Function()? onBack;
  final Widget child;
  final Widget? bottom;
  final double bottomSize;
  final Widget? top;
  final double topSize;
  final Function()? dimissAction;

  @override
  State<CustomDialog> createState() => _CustomDialogState();

  Future<T?> show<T>(BuildContext context) {
    return showCustomDialog<T>(context, child: this);
  }
}

class _CustomDialogState extends State<CustomDialog> {
  Widget _content(BuildContext context) => SafeArea(
        child: Container(
          height: context.heightPx,
          width: context.widthPx,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.showBackButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: AppColors.white.withOpacity(0.2),
                      child: InkWell(
                        onTap: widget.onBack ?? () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Gap(20),
                              Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColors.white,
                              ),
                              Gap(10),
                              Text(
                                widget.backText ?? 'VOLTAR',
                                style: TextStyle(color: AppColors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.red.withOpacity(0.2),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.close,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              Flexible(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.top != null) ...[
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 10,
                            left: 30,
                            right: 30,
                            top: 20,
                          ),
                          child: widget.top!,
                        ),
                      ],
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            color: Colors.white,
                            constraints: BoxConstraints(
                              maxHeight: (context.heightPx * 0.9) -
                                  (widget.bottom != null
                                      ? widget.bottomSize
                                      : 0) -
                                  (widget.top != null ? widget.topSize : 0),
                            ),
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: widget.child,
                            ),
                          ),
                        ),
                      ),
                      if (widget.bottom != null)
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 20,
                            left: 30,
                            right: 30,
                            top: 10,
                          ),
                          color: Colors.white,
                          child: widget.bottom!,
                        ),
                    ],
                  ),
                ),
              ),
              Gap(MediaQuery.viewInsetsOf(context).bottom),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }
}
