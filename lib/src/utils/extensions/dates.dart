import 'package:intl/intl.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

extension DateX on DateTime {
  String get dateTimeToString {
    return DateFormat.yMEd().add_Hms().format(this);
  }

  String get dateToString {
    return DateFormat.yMEd().format(this);
  }

  String get dayDifferenceToString {
    return difference(DateTime.now()).inDays < 1
        ? day == DateTime.now().day
            ? 'Today'
            : 'Tomorrow'
        : '${difference(DateTime.now()).inDays} days';
  }

  int get dateDifferenceInDays => difference(DateTime.now()).inDays;

  String get dateDifferenceFromNow {
    if (DateTime.now().toLocal().difference(this).isNegative) {
      return 'Just now';
    } else {
      if (DateTime.now().toLocal().difference(this).inMinutes < 2) {
        return 'Just now';
      } else if (DateTime.now().toLocal().difference(this).inMinutes < 60) {
        return '${DateTime.now().toLocal().difference(this).inMinutes}m ago';
      } else if (DateTime.now().toLocal().difference(this).inHours <= 22) {
        return '${DateTime.now().toLocal().difference(this).inHours}h ago';
      } else if (DateTime.now().toLocal().difference(this).inDays == 1) {
        return 'Yesterday';
      } else if (DateTime.now().toLocal().difference(this).inDays > 1 &&
          DateTime.now().toLocal().difference(this).inDays < 7) {
        return '${DateTime.now().toLocal().difference(this).inDays}d ago';
      } else if (DateTime.now().toLocal().difference(this).inDays > 7 &&
          DateTime.now().toLocal().difference(this).inDays < 30) {
        return '${DateTime.now().toLocal().difference(this).inDays ~/ 7}w ago';
      } else if (DateTime.now().toLocal().difference(this).inDays > 30 &&
          DateTime.now().toLocal().difference(this).inDays < 60) {
        return '${DateTime.now().toLocal().difference(this).inDays ~/ 30}mo ago';
      } else if (DateTime.now().toLocal().difference(this).inDays > 30 &&
          DateTime.now().toLocal().difference(this).inDays < 365) {
        return '${DateTime.now().toLocal().difference(this).inDays ~/ 30}mo ago';
      } else if (DateTime.now().toLocal().difference(this).inDays > 365) {
        return '${DateTime.now().toLocal().difference(this).inDays ~/ 365}y ago';
      }
    }

    // ignore: unused_local_variable
    String newDate = dateTimeToString.substring(0, 10);
    return "${DateTime.now().toLocal().difference(this).inDays.toString()}d ago";
  }

  String get modDateDifferenceForNotificationsScrn {
    final DateTime dateTime = toLocal();
    String formattedDate = '';
    if (DateTime.now().difference(dateTime).inMinutes < 2) {
      formattedDate = 'Just now';
    } else if (DateTime.now().difference(dateTime).inMinutes < 60) {
      formattedDate =
          '${DateTime.now().difference(dateTime).inMinutes} mins ago';
    } else if (DateTime.now().difference(dateTime).inHours < 24) {
      formattedDate = '${DateTime.now().difference(dateTime).inHours} hrs ago';
    }
    // option for 'yesterday'
    else if (DateTime.now().difference(dateTime).inDays < 2) {
      formattedDate = 'Yest at ${DateFormat.jm().format(dateTime).toString()}';
    } else if (DateTime.now().difference(dateTime).inDays < 7) {
      formattedDate =
          '${dateTime.day.shortDay} at ${DateFormat.jm().format(dateTime).toString()}';
    } else {
      formattedDate =
          '${DateFormat.yMMMd().format(dateTime)}, ${DateFormat.jm().format(dateTime)}';
    }
    // DateFormat.yMMMd().add_jm().format(dateTime).toString();
    return formattedDate;
  }
}

extension DateXString on String {
  String get dateDifferenceFromNow {
    DateTime postedDate = DateFormat.yMEd().add_Hms().parse(this);
    if (DateTime.now().toLocal().difference(postedDate).isNegative) {
      return 'Just now';
    } else {
      if (DateTime.now().toLocal().difference(postedDate).inMinutes < 2) {
        return 'Just now';
      } else if (DateTime.now().toLocal().difference(postedDate).inMinutes <
          60) {
        return '${DateTime.now().toLocal().difference(postedDate).inMinutes}m ago';
      } else if (DateTime.now().toLocal().difference(postedDate).inHours <=
          22) {
        return '${DateTime.now().toLocal().difference(postedDate).inHours}h ago';
      } else if (DateTime.now().toLocal().difference(postedDate).inDays == 1) {
        return 'Yesterday';
      } else if (DateTime.now().toLocal().difference(postedDate).inDays > 1 &&
          DateTime.now().toLocal().difference(postedDate).inDays < 7) {
        return '${DateTime.now().toLocal().difference(postedDate).inDays}d ago';
      } else if (DateTime.now().toLocal().difference(postedDate).inDays > 7 &&
          DateTime.now().toLocal().difference(postedDate).inDays < 30) {
        return '${DateTime.now().toLocal().difference(postedDate).inDays ~/ 7}w ago';
      } else if (DateTime.now().toLocal().difference(postedDate).inDays > 30 &&
          DateTime.now().toLocal().difference(postedDate).inDays < 60) {
        return '${DateTime.now().toLocal().difference(postedDate).inDays ~/ 30}mo ago';
      } else if (DateTime.now().toLocal().difference(postedDate).inDays > 30 &&
          DateTime.now().toLocal().difference(postedDate).inDays < 365) {
        return '${DateTime.now().toLocal().difference(postedDate).inDays ~/ 30}mo ago';
      } else if (DateTime.now().toLocal().difference(postedDate).inDays > 365) {
        return '${DateTime.now().toLocal().difference(postedDate).inDays ~/ 365}y ago';
      }
    }

    // ignore: unused_local_variable
    String newDate = substring(0, 10);
    return "${DateTime.now().toLocal().difference(postedDate).inDays.toString()}d ago";
  }
}
