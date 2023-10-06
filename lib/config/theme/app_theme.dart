
import 'package:flutter/material.dart';

  const colorList = <Color>[
    Colors.blue,
    Colors.pink,
    Colors.red,
    Colors.brown,
    Colors.orange,
    Colors.purple,
    Colors.green,
  ];
  
class AppTheme{

  final int selectedColor;

  AppTheme({
    required this.selectedColor, 
  }): assert( selectedColor >= 0, 'selected color must be greater then 0' ),
      assert( selectedColor < colorList.length, ' Selected color must be less or equal than ${ colorList.length - 1 }'
    );
  //Modificaciòn de los "themes" generales
  ThemeData getTheme() => ThemeData(
    // useMaterial3: true,
    colorSchemeSeed: colorList[ selectedColor ],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )

  );

}
