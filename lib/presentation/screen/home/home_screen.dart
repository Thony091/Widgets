import 'package:flutter/material.dart';
import 'package:widgets/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),        
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget{
  const _HomeView();

  @override
  Widget build(BuildContext context) {


   return ListView.builder(
    itemCount: MenuItem.appMenuItems.length,
    itemBuilder:(context, index) {
      
      final menuItem = MenuItem.appMenuItems[index];
      return _CustomListTile(menuItem: menuItem);
    },
   );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    super.key,
    required this.menuItem,
  });
  
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon( menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),   // wdg icon al final de la fila
      title: Text(menuItem.tittle),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        //TODO navegar a otra pantalla
      },
    );
  }
}