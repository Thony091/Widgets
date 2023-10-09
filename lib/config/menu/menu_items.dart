

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

    MenuItem(
      tittle: 'Animated Container', 
      subTitle: 'Statefull widget animated', 
      link: '/animated', 
      icon: Icons.check_box_outline_blank_outlined
    ),
    MenuItem(
      tittle: 'Ui Controls + Tiles', 
      subTitle: 'Ui controls widgets Flutter', 
      link: '/ui-controls', 
      icon: Icons.car_rental_outlined
    ),
    MenuItem(
      tittle: 'Tutorial de Aplicación', 
      subTitle: 'App Tutorial Flutter', 
      link: '/tutorial', 
      icon: Icons.accessible_rounded
    ),

  ];


}