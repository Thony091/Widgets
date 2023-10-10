
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/config/theme/app_theme.dart';
// boolean
final isDarkModeProvider = StateProvider( (ref) => false ); //creamos variable de tipo "StateProvider" este puede ser modificado 

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList); // variable de tipo "Provider", esta solo se puede leer(inmutable)

// int
final selectedIndexColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom)
//"ThemeNotifier", controla lo que pasa, "AppTheme" el estado es una instancia
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
  );


//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // State = Estado = new AppTheme();
  ThemeNotifier() : super( AppTheme() ); //Solicito que cree una primera instanmcia de "AppTheme"

  void toggleDarkMode(){
    state = state.copyWith( isDarkMode: !state.isDarkMode);
    //el nuevo "state" va a ser una copia del "state" actual, pero, enviando el valor de la variable "isDarkMode" con el valor opuesto
  }

  void changeColorIndex(){

  }


}