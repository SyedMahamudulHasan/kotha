import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotha/model/utils/constant.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  static const id = "/homeScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //==============app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.08,
                        child: Image.asset("assets/logo/logo.png"),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "TTIME",
                        style: TextStyle(
                          color: KColor.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.06,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.notifications,
                        color: Color(0xff040415),
                      ),
                      Icon(Icons.menu)
                    ],
                  )
                ],
              ),
              //=======================================>>
              SizedBox(
                height: size.width * 0.04,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      clientCardWidget(size),
                      clientCardWidget(size),
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      clientCardWidget(size),
                      clientCardWidget(size),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            selectedItemColor: KColor.secondaryColor,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: KColor.secondaryColor,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Color(0xffCDCDCD),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                    color: Color(0xffCDCDCD),
                  ),
                  label: "")
            ]),
      ),
    );
  }

  Stack clientCardWidget(Size size) {
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.35,
          //width: size.width * 0.4,
          child: Image.asset("assets/image/client.png"),
        ),
        const Positioned(
            right: 6,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                children: [
                  Text(
                    "Sahara Khan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.badge,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Designer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.034,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}
