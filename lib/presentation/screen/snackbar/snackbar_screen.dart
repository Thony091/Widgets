import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialogos'),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context)
      ),
    );
  }
}