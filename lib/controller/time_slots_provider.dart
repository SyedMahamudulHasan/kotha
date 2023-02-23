import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeSlotNotifier extends ChangeNotifier {
  List<DateTime> timeSlotList = [];
  bool isTomorrow = false;

  getTmeSlotList(int duration, int slot) {
    isTomorrow = false;
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    for (int i = 1; i <= slot; i++) {
      timeSlotList.add(
          //increase the time by time duration.
          DateTime.now().add(Duration(minutes: duration)));
      // check if the date time is tomorrow.
      if (DateTime.now().add(Duration(minutes: duration)) == tomorrow) {
        isTomorrow = true;
        notifyListeners();
      }
    }
    notifyListeners();
  }

//clean the list.
  resetSlot() {
    timeSlotList.clear();
    notifyListeners();
  }
}

final timeSlotProvider = ChangeNotifierProvider<TimeSlotNotifier>((ref) {
  return TimeSlotNotifier();
});
