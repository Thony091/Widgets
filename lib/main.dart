import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/config/router/app_router.dart';
import 'package:widgets/config/theme/app_theme.dart';
import 'package:widgets/presentation/providers/theme_provider.dart';


void main() {
  runApp(
    const ProviderScope( //para que riverpód sepa donde buscar los providers que se esten ocupando
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref ) {

    final isDarkMode = ref.watch(isDarkModeProvider);
    final selectedColor = ref.watch(selectedIndexColorProvider);
    
    return  MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme( selectedColor: selectedColor, isDarkMode: isDarkMode).getTheme(),
      //routes:       
      // {
      //   '/buttons':(context) => ButtonsScreen(),
      //   '/cards':(context) => CardsScreen(),
      // },   // * Forma antigua * conlleva limitantes
    );
  }
}