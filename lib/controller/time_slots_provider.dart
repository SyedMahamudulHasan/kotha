import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeSlotNotifier extends ChangeNotifier {
  List<DateTime> timeSlotList = [];
  List<Map<String, DateTime>> formatedTimeSlot = [];
  bool isTomorrow = false;

  setTmeSlotList(int duration, int slot) {
    isTomorrow = false;
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    int tempDuration = 0;

    for (int i = 1; i <= slot; i++) {
      //increase the time value by duration.
      tempDuration += duration;
      // add to the list.
      timeSlotList.add(
          //increase the time by time duration.
          DateTime.now().add(Duration(minutes: tempDuration)));
      // check if the date time is tomorrow.
      if (DateTime.now().add(Duration(minutes: tempDuration)) == tomorrow) {
        isTomorrow = true;
        notifyListeners();
      }
    }
    notifyListeners();
    getTimeSlot();
  }

  getTimeSlot() {
    print("=========>>lenght ${timeSlotList.length}");
    for (int i = 0; i < timeSlotList.length; i++) {
      if (i == 0) {
        formatedTimeSlot.add({"from": DateTime.now(), "to": timeSlotList[i]});
      } else {
        formatedTimeSlot
            .add({"from": timeSlotList[i - 1], "to": timeSlotList[i]});
      }
    }

    print(formatedTimeSlot);

    //return formatedTimeSlot;
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
