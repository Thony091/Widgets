import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const String name = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars(); // para esconder el snackbar inmediatamente cuando vuelvo a tocar el widget que hace lamado a esta función

    final snackBar =  SnackBar( //se guarda el mensaje que se mostrará dentro de una variable
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: (){}, textColor: Colors.amberAccent,),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar); //Muestra el widget que se requiere
  }
  void openDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog( // *** Builder = Algo que se va a construir en tiempo de ejecución ***
        title: const Text('¿Estas Seguro de realizar esta acción?'),
        content: const Text('Nulla proident anim et fugiat ut excepteur deserunt elit fugiat nulla nisi.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    ); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //para centrar los children
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                  const Text('Mollit laboris enim amet ad nostrud voluptate laborum.')
                  ]
                );
              }, 
              child: const Text('Licencias Usadas')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar Dialogo')
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context)
      ),
    );
  }
}