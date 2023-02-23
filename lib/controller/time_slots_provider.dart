import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeSlotNotifier extends ChangeNotifier {
  List<DateTime> timeSlotList = [];
  List<Map<String, dynamic>> formattedTimeSlot = [];
  bool nextDayFlag = false;

  setTmeSlotList(int duration, int slot) {
    final now = DateTime.now();
    int tempDuration = 0;

    for (int i = 1; i <= slot; i++) {
      //increase the time value by duration.
      tempDuration += duration;
      // add to the list.
      timeSlotList.add(
          //increase the time by time duration.
          DateTime.now().add(Duration(minutes: tempDuration)));
    }
    notifyListeners();
    getTimeSlot();
  }

//check if time goes to tomorrow.
//0 for today
  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  getTimeSlot() {
    print("=========>>lenght ${timeSlotList.length}");
    for (int i = 0; i < timeSlotList.length; i++) {
      if (i == 0) {
        //check if the date time is tomorrow.
        if (calculateDifference(timeSlotList[i]) != 0 && !nextDayFlag) {
          nextDayFlag = true;
          formattedTimeSlot.add({
            "from": DateTime.now(),
            "to": timeSlotList[i],
            "isTomorrow": true
          });
        } else {
          formattedTimeSlot.add({
            "from": DateTime.now(),
            "to": timeSlotList[i],
            "isTomorrow": false
          });
        }
      } else {
        if (calculateDifference(timeSlotList[i]) != 0 && !nextDayFlag) {
          formattedTimeSlot.add({
            "from": timeSlotList[i - 1],
            "to": timeSlotList[i],
            "isTomorrow": true
          });
        } else {
          formattedTimeSlot.add({
            "from": timeSlotList[i - 1],
            "to": timeSlotList[i],
            "isTomorrow": false
          });
        }
      }
    }

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
