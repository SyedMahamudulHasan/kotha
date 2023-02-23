import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotha/model/utils/constant.dart';
import 'package:kotha/view/screens/slot_screen.dart';
import 'package:kotha/view/widgets/custom_appbar.dart';

class DashScreen extends ConsumerStatefulWidget {
  const DashScreen({super.key});
  static const id = "/";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<DashScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // appbar
              CustomAppBar(size: size),
              SizedBox(height: size.height * 0.1),
              Center(child: Image.asset("assets/image/splash.png")),
              Text(
                "Focus on the work",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.08,
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //-============================>>> slots button
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, SlotScreen.id);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KColor.secondaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.15),
                      ),
                      child: Text(
                        "SLOTS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.04,
                        ),
                      )),
                  //============================>>> home button
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: size.height * 0.055,
                      width: size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "HOME",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
