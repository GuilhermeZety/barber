import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gap/gap.dart';
import 'package:barber/core/common/constants/app_colors.dart';
import 'package:barber/core/common/extensions/context_extension.dart';
import 'package:barber/core/common/extensions/widget_extension.dart';

class Toasting {
  static void error(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.error);
    }
    showNotification(
      context,
      color: Colors.red,
      title: title ?? 'Erro',
      icon: Icon(
        Icons.error,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void info(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.success);
    }
    showNotification(
      context,
      color: Colors.blue,
      title: title ?? 'Info',
      icon: Icon(
        Icons.info,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void success(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.success);
    }
    showNotification(
      context,
      color: Colors.green,
      title: title ?? 'Sucesso',
      icon: Icon(
        Icons.check_circle,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void noConnection(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.error);
    }
    showNotification(
      context,
      color: Colors.red,
      title: title ?? 'Sem conexão com a internet',
      icon: Icon(
        Icons.wifi_off_rounded,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void warning(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.warning);
    }
    showNotification(
      context,
      color: Colors.yellow.shade800,
      title: title ?? 'Aviso',
      icon: Icon(
        Icons.warning,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void showNotification(
    BuildContext context, {
    required Color color,
    required String title,
    String? subtitle,
    required Widget icon,
    Duration? duration,
  }) {
    BotToast.showCustomNotification(
      backButtonBehavior: BackButtonBehavior.close,
      duration: duration ?? Duration(seconds: 3),
      toastBuilder: (close) {
        return _CustomWidget(
          cancelFunc: close,
          title: title,
          color: color,
          subtitle: subtitle,
          icon: icon,
        );
      },
    );
  }
}

class _CustomWidget extends StatefulWidget {
  const _CustomWidget({
    required this.cancelFunc,
    required this.title,
    required this.color,
    this.subtitle,
    required this.icon,
  });

  final CancelFunc cancelFunc;
  final String title;
  final String? subtitle;
  final Widget icon;
  final Color color;

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<_CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(7),
            padding: EdgeInsets.all(3),
            color: Colors.black.withOpacity(0.05),
            child: Container(
              color: AppColors.white,
              constraints: BoxConstraints(
                minHeight: 50,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: (context.widthPx - 20) * 0.2,
                          color: widget.color,
                          child: Row(
                            children: [
                              Gap(((context.widthPx - 20) * 0.3) * 0.2),
                              widget.icon,
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(
                        (context.widthPx - 20) * 0.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: widget.subtitle != null
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              widget.title,
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (widget.subtitle != null) ...[
                              Gap(10),
                              Text(
                                widget.subtitle!,
                                style: TextStyle(
                                  color: AppColors.primary.withOpacity(0.5),
                                  fontSize: 14,
                                ),
                              ),
                            ]
                          ],
                        ),
                      ).expanded(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: widget.cancelFunc,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, top: 10),
                              child: Icon(Icons.close),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
