import 'package:flutter/material.dart';

const cards = <Map< String, dynamic >> [
  { 'elevation': 0.0, 'label':'Elevation 0'},
  { 'elevation': 1.0, 'label':'Elevation 1'},
  { 'elevation': 2.0, 'label':'Elevation 2'},
  { 'elevation': 3.0, 'label':'Elevation 3'},
  { 'elevation': 4.0, 'label':'Elevation 4'},
  { 'elevation': 5.0, 'label':'Elevation 5'},
  { 'elevation': 6.0, 'label':'Elevation 6'},
  { 'elevation': 7.0, 'label':'Elevation 7'},
  { 'elevation': 8.0, 'label':'Elevation 8'},
];


class CardsScreen extends StatelessWidget {
  
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards Screem'),),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView( // para ver todas las cartas como "hijo unico" (unificar)
      child: Column(
        children: [
    
          ...cards.map(
            (card) => _CardType1(label: card['label'], elevation: card['elevation'])),
            
          ...cards.map(
            (card) => _CardType2(label: card['label'], elevation: card['elevation'])),

          ...cards.map(
            (card) => _CardType3(label: card['label'], elevation: card['elevation'])),

          ...cards.map(
            (card) => _CardType4(label: card['label'], elevation: card['elevation'])),

          const SizedBox(height: 35,)
        ],
      ),
    );
  }
}


class _CardType1 extends StatelessWidget {
  
  final String label;
  final double elevation;
  
  const _CardType1({
    super.key, 
    required this.label, 
    required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: elevation,
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.more_vert_outlined)
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}



class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;
  
  const _CardType2({
    super.key, 
    required this.label, 
    required this.elevation});

  @override
  Widget build(BuildContext context) {

  final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.more_vert_outlined)
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}


class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;
  
  const _CardType3({
    super.key, 
    required this.label, 
    required this.elevation});

  @override
  Widget build(BuildContext context) {

  final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.more_vert_outlined)
              )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )
          ],
        ),
      ),
    );
  }
}



class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;
  
  const _CardType4({
    super.key, 
    required this.label, 
    required this.elevation});

  @override
  Widget build(BuildContext context) {


    return Card(
      clipBehavior: Clip.hardEdge,  //Evita que los hijos se salgan de la tarjeta
      elevation: elevation,

      child:  Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt() }/600/350',   //Damos el numero de elevacion(listado) y luego las dimensiones
            height: 250,
            fit: BoxFit.cover, //adaptar al cuerpo (tamaño de dimensiones)
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container( //contenedor que tendrá el icono y la decoracion de la caja contenedora
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20) )
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {}, 
              ),
            ),
          )
        ],
      ),
    );
  }
}