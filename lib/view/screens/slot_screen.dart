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

  @override
  void initState() {
    currentTime = DateTime.now();
    super.initState();
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
            ],
          ),
        ),
      ),
    );
  }
}
