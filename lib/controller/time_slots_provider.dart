import 'package:flutter/material.dart';

class TimeSlotNotifier extends ChangeNotifier {
  List<DateTime> timeSlotList = [];

  getTmeSlotList(int duration, int slot) {
    for (int i = 1; i <= slot; i++) {
      timeSlotList.add(
          //increase the time by time duration.
          DateTime.now().add(Duration(minutes: duration)));
    }
  }

//clean the list.
  resetSlot() {
    timeSlotList.clear();
  }
}
