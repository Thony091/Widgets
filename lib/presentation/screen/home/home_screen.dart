import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/config/menu/menu_items.dart';
import 'package:widgets/presentation/providers/theme_provider.dart';
import 'package:widgets/presentation/widgets/side_menu.dart';

class HomeScreen extends ConsumerWidget {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final isDarkMode = ref.watch( themeNotifierProvider ).isDarkMode;

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return  Scaffold(
      key: scaffoldKey, //tiene la referencia a este scaffold (tamaños, posiciones, etc.)
      appBar: AppBar(
        title: const Text('Flutter'),
                actions: [
            IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              //ref.read(isDarkModeProvider.notifier).update((state) => !state);
              ref.read( themeNotifierProvider.notifier )
              .toggleDarkMode();
              //controla el cambio de forma mas interna
            }, 
          )
        ],
      ),
    
      body: const _HomeView(),

      // "drawer" Barra lateral
      drawer: SideMenu(scaffoldKey: scaffoldKey,),
    
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
    required this.menuItem,
  });
  
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(

      leading: Icon( menuItem.icon, color: colors.primary,),    // wdg icon al inicio de la fila
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,),   // wdg icon al final de la fila
      title: Text(menuItem.tittle), // titulo de la fila, la obtiene de la variable menuItem
      subtitle: Text(menuItem.subTitle),
      
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   )
        // );

        //Navigator.pushNamed(context, menuItem.link);

        context.push( menuItem.link );
        // context.pushNamed( CardsScreen.name );
      },
    );
  }
}