import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backgroundColor: Colors.blue,
      elevation: 10,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarIconBrightness: Brightness.dark
      ),
      iconTheme: IconThemeData(
          color: Colors.black
      ),
    ),
    textTheme: TextTheme(
        bodyText1:TextStyle(
          color: Colors.black,
          fontSize: 20,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      elevation: 30,
      backgroundColor: Colors.white,
    )
);

ThemeData darkTheme() => ThemeData(
    scaffoldBackgroundColor: HexColor('343a40'),
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backgroundColor:  HexColor('343a40'),
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('343a40'),
          statusBarIconBrightness: Brightness.light
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    textTheme: TextTheme(
        bodyText1:TextStyle(
          color: Colors.white,
          fontSize: 20,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        elevation: 30,
        backgroundColor: HexColor('343a40')
    )
);