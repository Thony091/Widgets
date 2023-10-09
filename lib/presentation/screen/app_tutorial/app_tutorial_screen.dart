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
    return const Placeholder();
  }
}