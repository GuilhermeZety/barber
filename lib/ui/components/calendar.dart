import 'package:barber/core/common/constants/app_colors.dart';
import 'package:barber/core/common/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
    required this.selectedDay,
    required this.enabledDays,
    required this.onDaySelected,
  });

  final DateTime selectedDay;
  final List<DateTime> enabledDays;
  final void Function(DateTime) onDaySelected;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime now = DateTime.now();

  List<String> days = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];

  Widget createItem((int, int) e) {
    if (e.$1 != now.month) {
      return Container();
    }

    if (widget.selectedDay.month == e.$1 && widget.selectedDay.day == e.$2) {
      return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            e.$2.toString(),
            style: TextStyle(
              color: AppColors.inputs,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    if (widget.enabledDays
        .any((element) => element.month == e.$1 && element.day == e.$2)) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => widget.onDaySelected(
            DateTime(now.year, e.$1, e.$2),
          ),
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.shape,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                e.$2.toString(),
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Text(
          e.$2.toString(),
          style: TextStyle(
            color: AppColors.grey_hard,
          ),
        ),
      ),
    );
  }

  List<(int mounth, int day)> getDayList() {
    List<(int mounth, int day)> days = [];

    DateTime initialDate =
        DateTime(now.year, now.month).subtract(Duration(days: now.weekday + 1));

    for (var i = 1; i <= 35; i++) {
      var date = initialDate.add(Duration(days: i));
      if (date.month == now.month) {
        days.add((date.month, date.day));
      } else {
        days.add((date.month, date.day));
      }
    }
    return days;
  }

  void setDay(bool? back) {
    if (back == true) {
      if (now.month == 1) {
        now = DateTime(now.year - 1, 12);
      } else {
        now = DateTime(now.year, now.month - 1);
      }
      if (mounted) setState(() {});
      return;
    }
    if (now.month == 12) {
      now = DateTime(now.year + 1, 1);
    } else {
      now = DateTime(now.year, now.month + 1);
    }
    if (mounted) setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 370,
      decoration: BoxDecoration(
        color: AppColors.black_medium,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.shape,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.grey,
                    size: 16,
                  ),
                  onPressed: () => setDay(true),
                ),
                Text(
                  '${DateFormat('MMMM', 'pt').format(now)} ${now.year}',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: AppColors.grey,
                    size: 16,
                  ),
                  onPressed: () => setDay(null),
                ),
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 7,
            children: [
              ...List.generate(
                7,
                (index) => Center(
                  child: Text(
                    days[index],
                    style: TextStyle(
                      color: index == widget.selectedDay.weekday &&
                              now.month == widget.selectedDay.month
                          ? AppColors.primary
                          : null,
                    ),
                  ),
                ),
              ),
              ...getDayList()
                  .map(
                    (e) => createItem(e),
                  )
                  .toList()
            ],
          ).expanded()
        ],
      ),
    );
  }
}
