import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotha/view/screens/dash_screen.dart';
import 'package:kotha/view/screens/home_screen.dart';
import 'package:kotha/view/screens/slot_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: DashScreen.id,
        routes: {
          DashScreen.id: (context) => const DashScreen(),
          SlotScreen.id: (context) => const SlotScreen(),
          HomeScreen.id: (context) => const HomeScreen()
        });
  }
}
