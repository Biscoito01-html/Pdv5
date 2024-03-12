import 'package:flutter/material.dart';
import 'package:projetomoderno/themes/paletadecores.dart';

ThemeData buildThemeData() {
  return ThemeData(
      secondaryHeaderColor: CustomColors.primaryPurple,
      cardTheme: CardTheme(
        color: CustomColors.lightRose,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      iconTheme: const IconThemeData(
        color: CustomColors.white,
      ),
      primaryColorDark: CustomColors.blueDark,
      primaryColor: CustomColors.lightRed,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: CustomColors.darkPurple,
        elevation: 3,
        splashColor: CustomColors.lightPurple,
        foregroundColor: CustomColors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: CustomColors.primaryPurple,
        foregroundColor: CustomColors.white,
        elevation: 4,
        shadowColor: CustomColors.darkPurple,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: CustomColors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),
        toolbarTextStyle: TextStyle(
          color: CustomColors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.8,
        ),
        iconTheme: IconThemeData(
          color: CustomColors.white,
          size: 24.0,
        ),
        actionsIconTheme: IconThemeData(
          color: CustomColors.lightRose,
          size: 24.0,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            CustomColors.primaryPurple,
          ),
          foregroundColor: MaterialStateProperty.all(
            CustomColors.white,
          ),
          elevation: MaterialStateProperty.all(3),
        ),
      ),
      scaffoldBackgroundColor: CustomColors.black,
      fontFamily: 'RobotoSlab',
      hintColor: CustomColors.white,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: CustomColors.white,
          fontFamily: 'Roboto',
          fontSize: 14,
        ),
        bodyMedium: TextStyle(
          color: CustomColors.white,
          fontSize: 11,
        ),
        bodySmall: TextStyle(
          color: CustomColors.white,
          fontFamily: 'Roboto',
          fontSize: 9,
        ),
        headlineMedium:
            TextStyle(color: CustomColors.white, fontFamily: 'Roboto'),
      ),
      colorScheme: const ColorScheme.dark(
        primary: CustomColors.primaryPurple,
        secondary: CustomColors.darkPurple,
        onError: CustomColors.darkRed,
        background: CustomColors.lightGrey,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(CustomColors.darkGrey)),
      ));
}
