
import 'package:flutter/material.dart';

  const colorList = <Color>[
    Colors.blue,
    Colors.pink,
    Colors.red,
    Colors.brown,
    Colors.orange,
    Colors.purple,
    Colors.green,
    Colors.teal,
  ];
  
class AppTheme{

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false, 
    this.selectedColor = 0, 
  }): assert( selectedColor >= 0, 'selected color must be greater then 0' ),
      assert( selectedColor < colorList.length, ' Selected color must be less or equal than ${ colorList.length - 1 }'
    );
  //Modificaciòn de los "themes" generales
  ThemeData getTheme() => ThemeData(
    // useMaterial3: true,
    brightness: isDarkMode? Brightness.dark : Brightness.light, //"brightness"para controlar thema de app(color)
    colorSchemeSeed: colorList[ selectedColor ],
    appBarTheme: const AppBarTheme(
      // centerTitle: false //para evitar que centre el titulo
    )

  );

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode
  }) => AppTheme(
    selectedColor : selectedColor ?? this.selectedColor,
    isDarkMode    : isDarkMode    ?? this.isDarkMode,
  ); // tener una copia a mano de la clase, si se necesita cambiar el estado se crea un nuevo estado basado en el anterior

}
