import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  static const String name = 'animated_screen';
  
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width        = 50;
  double height       = 50;
  Color  color        = Colors.indigoAccent;
  double borderRadius = 10;

  void changeShape(){

    final random = Random();
    width           = random.nextInt(300) + 120;
    height          = random.nextInt(400) + 120;
    borderRadius    = random.nextInt(100) + 20;
    color = Color.fromRGBO(
      random.nextInt(255) + 1, //red 
      random.nextInt(255) + 1, //green
      random.nextInt(255) + 1, //blue
      1                        //opacity
    );
    setState(() {}); // para hacer cambios
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),

      body: Center(
        child: AnimatedContainer( // anima transiciones o cmabios
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
          width: width <= 0 ? 0 : width,    //Para evitar que sean negativos
          height: height <= 0 ? 0 :height,  //Para evitar que sean negativos
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: changeShape, //se referencia la funcion al tener la misma cantidad de argumentos, de otra forma es necesario la nomenclñatura larga
      child: Icon(Icons.play_arrow_rounded),),
    );
  }
}