import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screem'),),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {      
          context.pop();
        }, 
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    return SizedBox(  //
      width: double.infinity, //Tomará todo el ancho del dispositivo
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20), //Padding simetrico con las domensiones dadas
        child: Wrap(  //"Wrap" Alineará los botones que entre por fila 
          spacing: 10, //espacio a los lados     
          alignment: WrapAlignment.center,  //Alineamieto al centro
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),    
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_rounded), label: const Text('Elevated Icon'),),
            
            FilledButton(onPressed: () {}, child: const Text('Filled')),            
            FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.accessibility_new), label: const Text('Filled Icon')),

            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.outlined_flag), label: const Text('Outline Icon')),

            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(onPressed: () {}, icon: const Icon(Icons.text_fields_rounded), label: const Text('Text Button Icons')),

            const CustomButton(),

            IconButton(onPressed: () {}, icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon( Icons.app_registration_rounded,), 
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.blueAccent),
                iconColor:  MaterialStatePropertyAll(colors.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return  ClipRRect( // para controlar los bordes
      borderRadius: BorderRadius.circular(20),
      child: Material( //
        color: colors.primary,
        child: InkWell( //PArecido a Gestual Detector, reaccionando al onTap
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
            child: Text('Hi Words xD', style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}