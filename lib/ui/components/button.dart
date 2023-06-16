import 'package:barber/ui/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:barber/core/common/constants/app_colors.dart';
import 'package:barber/core/common/extensions/color_extension.dart';
import 'package:barber/ui/dialogs/toasting.dart';

// Custom buttons are created by extending the MaterialButton class
class Button extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final Widget? child;
  final ButtonStyle? style;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;
  final bool disabled;
  final Size? size;

  Button({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.size,
    this.disabled = false,
  }) : style = ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(2),
          backgroundColor: (disabled
                  ? AppColors.primary.withOpacity(0.4)
                  : AppColors.primary)
              .toMaterialStateProperty(),
          foregroundColor: AppColors.background.toMaterialStateProperty(),
          textStyle: MaterialStateProperty.all<TextStyle?>(
            TextStyle(color: AppColors.background, fontWeight: FontWeight.bold),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          ),
        );

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;
  late Future<void> Function() action;

  @override
  void initState() {
    action = () async {
      if (!mounted) return;
      try {
        if (widget.onPressed == null) return;

        isLoading = true;
        if (!mounted) return;
        setState(() {});

        Vibrate.feedback(FeedbackType.light);
        await widget.onPressed!();

        isLoading = false;
        if (!mounted) return;
        setState(() {});
      } catch (err) {
        if (!mounted) return;
        Toasting.error(context, title: 'Erro: $err');
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: !widget.disabled ? action : null,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      onHover: widget.onHover,
      onLongPress: !widget.disabled
          ? () {
              if (widget.onLongPress != null) {
                Vibrate.feedback(FeedbackType.light);
                widget.onLongPress!();
              }
            }
          : null,
      style: widget.style?.copyWith(
        fixedSize: widget.size != null
            ? MaterialStateProperty.all<Size>(widget.size!)
            : null,
      ),
      child: isLoading ? Loader(size: 16, inverted: true) : widget.child,
    );
  }
}
