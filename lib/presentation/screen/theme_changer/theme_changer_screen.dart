import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    // final isDarkMode = ref.watch(isDarkModeProvider);
    final isDarkMode = ref.watch( themeNotifierProvider ).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
            IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              //ref.read(isDarkModeProvider.notifier).update((state) => !state);
              ref.read( themeNotifierProvider.notifier )
              .toggleDarkMode();
              //controla el cambio de forma mas interna
            }, 
          )
        ],

      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    //final selectedColor = ref.watch(selectedIndexColorProvider);
    final selectedColor = ref.watch( themeNotifierProvider).selectedColor;
    // final isDarkMode         = ref.watch(isDarkModeProvider);
    
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        
        final color = colors[index];

        return RadioListTile(
          title: Text('Este Color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          groupValue: selectedColor, 
          value: index, 
          onChanged: (value) {
            
            ref.watch( themeNotifierProvider.notifier )
              .changeColorIndex(index);
          },
        );
      },
    );
  }
}