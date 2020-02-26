import 'package:flutter/material.dart';
import 'package:pokemon2/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height * 2,
            width: MediaQuery.of(context).size.width-20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.05,
            child: SingleChildScrollView(
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 150.0,
                        ),
                        Text(pokemon.name,
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold)),
                        Text("Height: ${pokemon.height}",
                            style: TextStyle(
                                fontFamily: 'PTS',
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic)),
                        Text("Weight: ${pokemon.weight}",
                            style: TextStyle(
                                fontFamily: 'PTS',
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic)),
                        Text("Types",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold)),
                        new Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          direction: Axis.horizontal,
                          children: pokemon.type
                              .map((t) => FilterChip(
                                  label: Text(t,
                                      style: TextStyle(
                                          fontFamily: 'PTS',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  backgroundColor: Colors.green[600],
                                  onSelected: (b) {}))
                              .toList(),
                        ),
                        Text("Weakness",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        new Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          direction: Axis.horizontal,
                          children: pokemon.weaknesses
                              .map((t) => FilterChip(
                                  label: Text(
                                    t,
                                    style: TextStyle(
                                        fontFamily: 'PTS',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                  onSelected: (b) {}))
                              .toList(),
                        ),
                        Text("Prev-Evolution",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        new Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          direction: Axis.horizontal,
                          children: pokemon.prevEvolution == null
                              ? <Widget>[
                                  Text("This is the first form",
                                      style: TextStyle(
                                          fontFamily: 'PTS',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ]
                              : pokemon.prevEvolution
                                  .map((n) => FilterChip(
                                        backgroundColor: Colors.orangeAccent,
                                        label: Text(
                                          n.name,
                                          style: TextStyle(
                                              fontFamily: 'PTS',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        onSelected: (b) {},
                                      ))
                                  .toList(),
                        ),
                        Text("Next-Evolution",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        new Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          direction: Axis.horizontal,
                          children: pokemon.nextEvolution == null
                              ? <Widget>[
                                  Text("This is the final form",
                                      style: TextStyle(
                                          fontFamily: 'PTS',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))
                                ]
                              : pokemon.nextEvolution
                                  .map((n) => FilterChip(
                                        backgroundColor: Colors.lightGreen,
                                        label: Text(
                                          n.name,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onSelected: (b) {},
                                      ))
                                  .toList(),
                        ),
                      ],
                    )),
                scrollDirection: Axis.vertical,
                reverse: false,),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(pokemon.img), fit: BoxFit.cover),
                  ),
                )),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.greenAccent,
        title: Text(pokemon.name),
        elevation: 2.0,
      ),
      body: bodyWidget(context),
    );
  }
}
