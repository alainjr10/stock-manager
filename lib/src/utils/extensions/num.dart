extension NumX on num {
  // day number to day
  String get longDay => switch (this) {
        1 => 'Monday',
        2 => 'Tuesday',
        3 => 'Wednesday',
        4 => 'Thursday',
        5 => 'Friday',
        6 => 'Saturday',
        7 => 'Sunday',
        _ => 'Sunday',
      };

  // short day
  String get shortDay => switch (this) {
        1 => 'Mon',
        2 => 'Tue',
        3 => 'Wed',
        4 => 'Thu',
        5 => 'Fri',
        6 => 'Sat',
        7 => 'Sun',
        _ => 'Sun',
      };

  // get dates based on the date code
  // duration: 0 for all, 1 for today 2 for past 7 days, 3 for past 30 days, 4 for past 90 days, 5 for this week, 6 for this month, 7 for this year
  /// DATE CODES
  /// 0 for all
  /// 1 for today
  /// 2 for past 7 days
  /// 3 for past 30 days
  /// 4 for past 90 days
  /// 5 for this week
  /// 6 for this month
  /// 7 for this year
  DateTime get startDate => switch (this) {
        1 => DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        2 => DateTime.now().subtract(const Duration(days: 6)),
        3 => DateTime.now().subtract(const Duration(days: 29)),
        4 => DateTime.now().subtract(const Duration(days: 89)),
        5 =>
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)),
        6 => DateTime(DateTime.now().year, DateTime.now().month, 1),
        7 => DateTime(DateTime.now().year, 1, 1),
        _ => DateTime(DateTime.now().year - 1, 1, 1),
      };

  String get durationCodeString => switch (this) {
        0 => 'All',
        1 => 'Today',
        2 => 'Past 7 days',
        3 => 'Past 30 days',
        4 => 'Past 90 days',
        5 => 'This week',
        6 => 'This month',
        7 => 'This year',
        _ => 'All',
      };
}
