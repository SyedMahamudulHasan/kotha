import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: inputBorder(),
                          focusedBorder: inputBorder(),
                        ),
                      ))
                ],
              ),
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: inputBorder(),
                          focusedBorder: inputBorder(),
                        ),
                      ))
                ],
              ),
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
