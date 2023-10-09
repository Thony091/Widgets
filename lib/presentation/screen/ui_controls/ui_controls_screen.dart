import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transpotation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transpotation selectedTransportation = Transpotation.car;
  bool wantsBreakFast = false;
  bool wantslunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Adicional Controls'),
          value: true,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        // Para Hacer Selectores
        ExpansionTile(
          title: const Text('Vehiculo Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              value: Transpotation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transpotation.car;
              })),
            RadioListTile(
              title: const Text('By Boat'),
              value: Transpotation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transpotation.boat;
              })),
            RadioListTile(
              title: const Text('By Plane'),
              value: Transpotation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transpotation.plane;
              })),
            RadioListTile(
              title: const Text('By Submarine'),
              value: Transpotation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transpotation.submarine;
              })),
          ],
        ),
        //TODO por aqui

        // Para hacer checkbox

        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakFast, 
          onChanged: ((value) => setState(() {
            wantsBreakFast = !wantsBreakFast;
            })
          )
        ),
        CheckboxListTile(
          title: const Text('¿Almuerzo?'),
          value: wantslunch, 
          onChanged: ((value) => setState(() {
            wantslunch = !wantslunch;
            })
          )
        ),
        CheckboxListTile(
          title: const Text('¿Cena?'),
          value: wantsDinner, 
          onChanged: ((value) => setState(() {
            wantsDinner = !wantsBreakFast;
            })
          )
        )
      ],
    );
  }
}
