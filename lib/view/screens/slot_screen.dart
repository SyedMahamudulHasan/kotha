import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kotha/controller/time_slots_provider.dart';
import 'package:kotha/view/widgets/custom_appbar.dart';

class SlotScreen extends ConsumerStatefulWidget {
  const SlotScreen({super.key});
  static const id = "/slotScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SlotScreenState();
}

class _SlotScreenState extends ConsumerState<SlotScreen> {
  DateTime? currentTime;
  TextEditingController? _durationCtr;
  TextEditingController? _slotCtr;

  @override
  void initState() {
    currentTime = DateTime.now();
    _slotCtr = TextEditingController();
    _durationCtr = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _durationCtr!.dispose();
    _slotCtr!.dispose();
    super.dispose();
  }

  _getCurrentTime() {
    return DateFormat.jm().format(currentTime!);
  }

  _getFormatedTime(DateTime time) {
    return DateFormat.jm().format(time);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final timeProvider = ref.watch(timeSlotProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(size: size),
              SizedBox(height: size.width * 0.04),
              //==============time now
              Text(
                "Time Now: ${_getCurrentTime()}",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: size.width * 0.08,
                ),
              ),
              SizedBox(height: size.width * 0.04),
              //====================>>> time duration
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Enter Duration(min)",
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  SizedBox(
                    width: size.width * 0.26,
                    height: size.width * 0.12,
                    child: TextFormField(
                      controller: _durationCtr,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: inputBorder(),
                        focusedBorder: inputBorder(),
                      ),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                    ),
                  )
                ],
              ),
              //===================================>>> slots input field
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Max Slots",
                    style: TextStyle(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  SizedBox(
                    width: size.width * 0.26,
                    height: size.width * 0.12,
                    child: TextFormField(
                      controller: _slotCtr,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: inputBorder(),
                        focusedBorder: inputBorder(),
                      ),
                      onFieldSubmitted: (value) {
                        if (_durationCtr!.text.isNotEmpty) {
                          ref.read(timeSlotProvider.notifier).setTmeSlotList(
                              int.parse(_durationCtr!.text),
                              int.parse(_slotCtr!.text));
                        }
                      },
                    ),
                  )
                ],
              ),
//=================================>> list of time slot
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: ListView.builder(
                      itemCount: timeProvider.formatedTimeSlot.length,
                      itemBuilder: ((context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_getFormatedTime(timeProvider
                                    .formatedTimeSlot[index]["from"]!)
                                .toString()),
                            Text(_getFormatedTime(
                                    timeProvider.formatedTimeSlot[index]["to"]!)
                                .toString()),
                          ],
                        );
                      })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }
}
