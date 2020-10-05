import 'package:flutter/material.dart';

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

const Color zdvOrange = Color(0xFFFB8500);
const MaterialColor zdvmOrange = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFB8500),
    100: const Color(0xFFFB8500),
    200: const Color(0xFFFB8500),
    300: const Color(0xFFFB8500),
    400: const Color(0xFFFB8500),
    500: const Color(0xFFFB8500),
    600: const Color(0xFFFB8500),
    700: const Color(0xFFFB8500),
    800: const Color(0xFFFB8500),
    900: const Color(0xFFFB8500),
  },
);

const Color zdvYellow = Color(0xFFFFB703);
const MaterialColor zdvmYellow = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFB703),
    100: const Color(0xFFFFB703),
    200: const Color(0xFFFFB703),
    300: const Color(0xFFFFB703),
    400: const Color(0xFFFFB703),
    500: const Color(0xFFFFB703),
    600: const Color(0xFFFFB703),
    700: const Color(0xFFFFB703),
    800: const Color(0xFFFFB703),
    900: const Color(0xFFFFB703),
  },
);

const Color zdvDrkBlue = Color(0xFF023047);
const MaterialColor zdvmDrkBlue = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFF023047),
    100: const Color(0xFF023047),
    200: const Color(0xFF023047),
    300: const Color(0xFF023047),
    400: const Color(0xFF023047),
    500: const Color(0xFF023047),
    600: const Color(0xFF023047),
    700: const Color(0xFF023047),
    800: const Color(0xFF023047),
    900: const Color(0xFF023047),
  },
);

const Color zdvMidBlue = Color(0xFF219EBC);
const MaterialColor zdvmMidBlue = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFF219EBC),
    100: const Color(0xFF219EBC),
    200: const Color(0xFF219EBC),
    300: const Color(0xFF219EBC),
    400: const Color(0xFF219EBC),
    500: const Color(0xFF219EBC),
    600: const Color(0xFF219EBC),
    700: const Color(0xFF219EBC),
    800: const Color(0xFF219EBC),
    900: const Color(0xFF219EBC),
  },
);

const Color zdvLgtBlue = Color(0xFF8ECAE6);
const MaterialColor zdvmLgtBlue = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFF8ECAE6),
    100: const Color(0xFF8ECAE6),
    200: const Color(0xFF8ECAE6),
    300: const Color(0xFF8ECAE6),
    400: const Color(0xFF8ECAE6),
    500: const Color(0xFF8ECAE6),
    600: const Color(0xFF8ECAE6),
    700: const Color(0xFF8ECAE6),
    800: const Color(0xFF8ECAE6),
    900: const Color(0xFF8ECAE6),
  },
);

final ThemeData myTheme = ThemeData(
  primarySwatch: zdvmOrange,
  brightness: Brightness.light,
  primaryColor: Color(0xfff8f8f8),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: zdvmOrange,
  primaryColorDark: zdvmOrange,
  accentColor: zdvmOrange,
  accentColorBrightness: Brightness.dark,
  canvasColor: Color(0xfffafafa),
  scaffoldBackgroundColor: Color(0xfffafafa),
  bottomAppBarColor: Color(0x00ffffff),
  cardColor: Color(0xffffffff),
  dividerColor: Color(0x1f000000),
  highlightColor: Color(0x66bcbcbc),
  splashColor: Color(0x66c8c8c8),
  selectedRowColor: Color(0xfff5f5f5),
  unselectedWidgetColor: Color(0x8a000000),
  disabledColor: Color(0x61000000),
  buttonColor: Color(0xffe0e0e0),
  toggleableActiveColor: Color(0xff666666),
  secondaryHeaderColor: Color(0xfff2f2f2),
  textSelectionColor: Color(0xffcccccc),
  cursorColor: Color(0xff4285f4),
  textSelectionHandleColor: Color(0xffb3b3aa),
  backgroundColor: Color(0xffcccccc),
  dialogBackgroundColor: Color(0xffffffff),
  indicatorColor: Color(0xff808080),
  hintColor: Color(0x8a000000),
  errorColor: Color(0xffd32f2f),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    alignedDropdown: false,
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xffffffff),
      primaryVariant: Color(0xff4d4d4d),
      secondary: Color(0xff808080),
      secondaryVariant: Color(0xff4d4d4d),
      surface: Color(0xffffffff),
      background: Color(0xffcccccc),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xff000000),
      onSecondary: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onBackground: Color(0xff000000),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),
  // textTheme: TextTheme(
  //   display4: TextStyle(
  //     color: Color(0x8a000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   display3: TextStyle(
  //     color: Color(0x8a000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   display2: TextStyle(
  //     color: Color(0x8a000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   display1: TextStyle(
  //     color: Color(0x8a000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   headline: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   title: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   subhead: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   body2: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   body1: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   caption: TextStyle(
  //     color: Color(0x8a000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   button: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   subtitle: TextStyle(
  //     color: Color(0xff000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   overline: TextStyle(
  //     color: Color(0xff000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  // ),
  primaryTextTheme: TextTheme(
    headline1: TextStyle(
      color: Color(0x8a000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      color: Color(0x8a000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline3: TextStyle(
      color: Color(0x8a000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline4: TextStyle(
      color: Color(0x8a000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline5: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    caption: TextStyle(
      color: Color(0x8a000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Color(0xdd000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: TextStyle(
      color: Color(0xff000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: Color(0xff000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  // accentTextTheme: TextTheme(
  //   display4: TextStyle(
  //     color: Color(0xb3ffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   display3: TextStyle(
  //     color: Color(0xb3ffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   display2: TextStyle(
  //     color: Color(0xb3ffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   display1: TextStyle(
  //     color: Color(0xb3ffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   headline: TextStyle(
  //     color: Color(0xffffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   title: TextStyle(
  //     color: Color(0xffffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   subhead: TextStyle(
  //     color: Color(0xffffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   body2: TextStyle(
  //     color: Color(0xffffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   body1: TextStyle(
  //     color: Color(0xffffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   caption: TextStyle(
  //     color: Color(0xb3ffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   button: TextStyle(
  //     color: Color(0xffffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   subtitle: TextStyle(
  //     color: Color(0xffffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   overline: TextStyle(
  //     color: Color(0xffffffff),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  // ),
  // inputDecorationTheme: InputDecorationTheme(
  //   labelStyle: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   helperStyle: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   hintStyle: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   errorStyle: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   errorMaxLines: null,
  //   hasFloatingPlaceholder: true,
  //   isDense: false,
  //   contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
  //   isCollapsed: false,
  //   prefixStyle: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   suffixStyle: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   counterStyle: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  //   filled: false,
  //   fillColor: Color(0x00000000),
  //   errorBorder: UnderlineInputBorder(
  //     borderSide: BorderSide(
  //       color: Color(0xff000000),
  //       width: 1,
  //       style: BorderStyle.solid,
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
  //   ),
  //   focusedBorder: UnderlineInputBorder(
  //     borderSide: BorderSide(
  //       color: Color(0xff000000),
  //       width: 1,
  //       style: BorderStyle.solid,
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
  //   ),
  //   focusedErrorBorder: UnderlineInputBorder(
  //     borderSide: BorderSide(
  //       color: Color(0xff000000),
  //       width: 1,
  //       style: BorderStyle.solid,
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
  //   ),
  //   disabledBorder: UnderlineInputBorder(
  //     borderSide: BorderSide(
  //       color: Color(0xff000000),
  //       width: 1,
  //       style: BorderStyle.solid,
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
  //   ),
  //   enabledBorder: UnderlineInputBorder(
  //     borderSide: BorderSide(
  //       color: Color(0xff000000),
  //       width: 1,
  //       style: BorderStyle.solid,
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
  //   ),
  //   border: UnderlineInputBorder(
  //     borderSide: BorderSide(
  //       color: Color(0xff000000),
  //       width: 1,
  //       style: BorderStyle.solid,
  //     ),
  //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
  //   ),
  // ),
  iconTheme: IconThemeData(
    color: Color(0xFF219EBC),
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: IconThemeData(
    color: Color(0xFF219EBC),
    opacity: 1,
    size: 24,
  ),
  accentIconTheme: IconThemeData(
    color: Color(0xFF219EBC),
    opacity: 1,
    size: 24,
  ),
  // sliderTheme: SliderThemeData(
  //   activeTrackColor: null,
  //   inactiveTrackColor: null,
  //   disabledActiveTrackColor: null,
  //   disabledInactiveTrackColor: null,
  //   activeTickMarkColor: null,
  //   inactiveTickMarkColor: null,
  //   disabledActiveTickMarkColor: null,
  //   disabledInactiveTickMarkColor: null,
  //   thumbColor: null,
  //   disabledThumbColor: null,
  //   thumbShape: null(),
  //   overlayColor: null,
  //   valueIndicatorColor: null,
  //   valueIndicatorShape: null(),
  //   showValueIndicator: null,
  //   valueIndicatorTextStyle: TextStyle(
  //     color: Color(0xffffffff),
  //     fontSize: null,
  //     fontWeight: ontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  // ),
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color(0xdd000000),
    unselectedLabelColor: Color(0xb2000000),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Color(0x1f000000),
    brightness: Brightness.light,
    deleteIconColor: Color(0xde000000),
    disabledColor: Color(0x0c000000),
    labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
    labelStyle: TextStyle(
      color: Color(0xde000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
    secondaryLabelStyle: TextStyle(
      color: Color(0x3d000000),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: Color(0x3dffffff),
    selectedColor: Color(0x3d000000),
    shape: StadiumBorder(
        side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    )),
  ),
  dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  )),
);
