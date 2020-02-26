import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon2/pokedetail.dart';
import 'package:pokemon2/pokemon.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
      title: "Pokemon App",
      home: HomePage(),
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Carter'),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/Adrian-Cruz-SanJuan/pokedex_yuko/master/pokemon.json";
  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var res = await http.get(url);
    var decodedValue = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodedValue);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon App"),
        backgroundColor: Colors.greenAccent,
      ),
      body: pokeHub == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: pokeHub.pokemon
                  .map((Pokemon poke) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PokeDetail(
                                          pokemon: poke,
                                        )));
                          },
                          child: Card(
                            elevation: 3.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Hero(
                                  tag: poke.img,
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(poke.img)),
                                    ),
                                  ),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              child: Text("Pokemon App",
                  style: TextStyle(fontFamily: 'Carter', fontSize: 30)),
              decoration: BoxDecoration(color: Colors.greenAccent),
            ),
            ListTile(
                title: Text(
              "Romero Sosa Emma Yuridia",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            )),
            ListTile(
                title: Text(
              "Rodriguez Velasco Eliazar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            )),
            ListTile(
                title: Text(
              "Leon Barron Adolfo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            )),
            ListTile(
                title: Text(
              "Cruz San Juan Adrian",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            )),
            ListTile(
                title: Text(
              "Muñoz Ruíz Nazareth",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            )),
            ListTile(
                title: Text(
                  "Meneses Alegria Diana Marlen",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                )),
            ListTile(
                title: Text(
                  "Luis Hernandez Oliveira",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ))

          ],
        ),
      ),
    );
  }
}
