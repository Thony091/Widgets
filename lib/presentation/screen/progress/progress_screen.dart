import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const String name = 'progress_scroll_screen';
  
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView(
  );

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox( height: 30,),
          Text('Circular Progress Indicator'),
          
          SizedBox(height: 10,),
          CircularProgressIndicator(strokeWidth: 5, backgroundColor: Colors.lightBlueAccent,),
          
          SizedBox(height: 20,),
          Text('Circular and Linear Controled'),
          SizedBox(height: 10,),

          _ControllerProgressIndicator(),

        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder( //se construye en tiempo de ejecución, ventaja que al dejar de usar dejar de consumir memoria.
      stream: Stream.periodic( const Duration(milliseconds: 500), (value){ //met solicita duracion entre saltos y el intervalo enviado por una func 
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100), //toma el valor hasta que
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0; // si no tiene valor se inicia en 0

        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value:progressValue, strokeWidth: 3, backgroundColor: Colors.pinkAccent,),
              const SizedBox(width: 20,),
              Expanded( //para que toma la totalidad del espacio en horizontal
                child: LinearProgressIndicator(value:progressValue, backgroundColor: Colors.redAccent,)
              ),
            ],
          ),
        );
      }
    );
  }
}