import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/presentation/providers/couter_providers.dart';
import 'package:widgets/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget { //ConsumerWidget para habilitar referencias de riverpod

  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch( counterProvider ); //"watch()" esta pendiente de algun cambio ocurrido con la variable ingresada
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              //se actualiza el valor de la variable "isDarkProvider"
              ref.read( isDarkModeProvider.notifier )
                .update((state) => !state);

            }, 
          )
        ],
      ),

      body:Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge,),
      ),


      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed:() {      
          //"read()"para leer algun provider ".notifier" notifica el estado o valor de la variable, ".state++" tiene el valor del valor de la variable y suma con cada presion al icono
          ref.read( counterProvider.notifier ).state++;
          //ref.read( counterProvider.notifier ).update((state) => state+1);  //otra forma de hacer cambios
      }),
    );
  }
}