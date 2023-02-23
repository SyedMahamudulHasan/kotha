import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeSlotNotifier extends ChangeNotifier {
  List<DateTime> timeSlotList = [];

  getTmeSlotList(int duration, int slot) {
    for (int i = 1; i <= slot; i++) {
      timeSlotList.add(
          //increase the time by time duration.
          DateTime.now().add(Duration(minutes: duration)));
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
