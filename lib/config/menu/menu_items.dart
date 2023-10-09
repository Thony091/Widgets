

import 'package:flutter/material.dart';

class MenuItem {
  
  final String tittle;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.tittle, 
    required this.subTitle, 
    required this.link, 
    required this.icon, 
  });

  static const appMenuItems = <MenuItem> [

    MenuItem(
      tittle: 'Botones', 
      subTitle: 'Varios botones en flutter', 
      link: '/buttons', 
      icon: Icons.smart_button_outlined
    ),

    MenuItem(
      tittle: 'Tarjetas', 
      subTitle: 'Un contenedor estilizado', 
      link: '/cards', 
      icon: Icons.credit_card
    ),

    MenuItem(
      tittle: 'ProgressIndicators', 
      subTitle: 'Generales y controlados', 
      link: '/progress', 
      icon: Icons.refresh_rounded
    ),

    MenuItem(
      tittle: 'Snackbar & dialogates', 
      subTitle: 'Indicadores en pantalla', 
      link: '/snackbar', 
      icon: Icons.info_outline
    ),

  ];


}