

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35; // MediaQuery.of... (para calcular el espacio ocupado por Notch)

  
    return  NavigationDrawer(

      selectedIndex: navDrawerIndex, // Se muestra seleccionado el indice indicado ("navDrawerIndex = 1") desde el inicio
      onDestinationSelected: (value) { // Para cambiar la seleccion según el indice. Funct con 'value' de argumento. "value" tomará el valor del contexto(el que se toque en la pantalla)
        setState(() {   // Funct "setState" para hacer cambios
          navDrawerIndex = value; // Dar nuevo valor a variable "navDrawerIndex" y reemplazarlo por el valor que tenga "value"
        });
        final menuItem = MenuItem.appMenuItems[value];
        context.push( menuItem.link );//Redirecciona al screen correspondiente
        // context.push(menuItem.link); **************
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children:  [

        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Main'),
        ),

        ...MenuItem.appMenuItems
          .sublist(0,1) //mtd para separar por sublistas elegidas
          .map((item) =>  NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.tittle),
            
          )
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10 , 16, 10),
          child: Text('More Options'),
        ),

        ...MenuItem.appMenuItems
          .sublist(1)
          .map((item) =>  NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.tittle)
          )
        ),

      ]
    );
  }
}