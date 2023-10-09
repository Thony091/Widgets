import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title, 
    this.caption, 
    this.imageUrl
  );
}

final slides = <SlideInfo>[
  SlideInfo('Busca la Comida', 'Et ea deserunt voluptate occaecat laboris qui proident sunt irure anim consectetur culpa enim duis.', 'assets/images/1.png'),
  SlideInfo('Entrega Rapida', 'Pariatur voluptate Lorem in laboris culpa ullamco officia non duis ut sint ex fugiat incididunt.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Aliqua est voluptate culpa excepteur aliqua ut aliqua adipisicing nostrud elit.', 'assets/images/3.png'),
];


class AppTutorialScreen extends StatelessWidget {

  static const String name = 'app_tutorial_screen';
  
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView( //Mostrar páginas slides
            physics: const BouncingScrollPhysics(), //efecto al tratar de scrollear
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
              )
            ).toList(),//transformar a lista ".map" devuelve un iterable
          ),
          Positioned( // posicionar un textButton
            right: 20,
            top: 50,            
            child: TextButton(
              onPressed: () => context.pop(), 
              child: Text('Salir'),
              )
          )
        ],
      ),
    );
  }
} 

class _Slide extends StatelessWidget {
 
 final String title;
 final String caption;
 final String imageUrl;

  const _Slide({
    super.key, 
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            SizedBox(height: 10,),
            Text(caption, style: captionStyle,),

          ],
        ),
      ),
      );
  }
}