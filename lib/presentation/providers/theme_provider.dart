
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/config/theme/app_theme.dart';
// boolean
final isDarkModeProvider = StateProvider( (ref) => false ); //creamos variable de tipo "StateProvider" este puede ser modificado 

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList); // variable de tipo "Provider", esta solo se puede leer(inmutable)

// int
final selectedIndexColorProvider = StateProvider((ref) => 0);