import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData get light => ThemeData.light().copyWith(
        primaryColor: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          iconTheme: IconThemeData(color: Color.fromRGBO(51, 102, 153, 1)),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: Colors.grey[300],
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Color.fromRGBO(51, 102, 153, 1),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromRGBO(51, 102, 153, 1),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
              Colors.green[300],
            ),
            fixedSize: MaterialStateProperty.all(const Size(120, 40)),
          ),
        ),
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        primaryColor: const Color.fromRGBO(32, 35, 42, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(32, 35, 42, 1),
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(97, 218, 251, 1),
          ),
        ),
        // brightness: Brightness.dark,
        // iconTheme: const IconThemeData(
        //   color: Color.fromRGBO(97, 218, 251, 1),
        // ),
        // primaryIconTheme:
        //     const IconThemeData(color: Color.fromRGBO(97, 218, 251, 1)),
        scaffoldBackgroundColor: const Color.fromRGBO(40, 44, 52, 1),
        canvasColor: const Color.fromRGBO(40, 44, 52, 1),
        dialogBackgroundColor: const Color.fromRGBO(40, 44, 52, 1),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(40, 44, 52, 1),
          selectedIconTheme: IconThemeData(
            color: Color.fromRGBO(97, 218, 251, 1),
          ),
          selectedItemColor: Color.fromRGBO(97, 218, 251, 1),
          unselectedItemColor: Colors.white54,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
              Colors.green[300],
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            fixedSize: MaterialStateProperty.all(const Size(120, 40)),
          ),
        ),
      );
}
