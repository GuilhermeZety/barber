import 'package:barber/core/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SelectItem extends StatefulWidget {
  const SelectItem({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelect,
    this.disabled = false,
  });

  final String text;
  final bool selected;
  final void Function(bool) onSelect;
  final bool disabled;

  @override
  State<SelectItem> createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  int transitionTime = 100;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MouseRegion(
          cursor:
              widget.disabled ? MouseCursor.defer : SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.disabled
                ? null
                : () => widget.onSelect(!widget.selected),
            child: AnimatedContainer(
              duration: transitionTime.ms,
              decoration: BoxDecoration(
                color: widget.selected ? AppColors.primary : AppColors.shape,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: AnimatedDefaultTextStyle(
                duration: transitionTime.ms,
                style: TextStyle(
                  fontWeight:
                      widget.selected ? FontWeight.w600 : FontWeight.w500,
                  color: widget.selected ? AppColors.inputs : AppColors.white,
                  letterSpacing: 0.5,
                ),
                child: Text(widget.text),
              ),
            ),
          ),
        ),
        if (widget.disabled)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.black_medium.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
      ],
    );
  }
}
