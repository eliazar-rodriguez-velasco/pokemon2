import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon2/pokedetail.dart';
import 'package:pokemon2/pokemon.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
      title: "Pokemon App",
      home: HomePage(),
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://raw.githubusercontent.com/emmaRomero19/flutter/master/pokemon/pokemon.json";
  PokeHub pokeHub;

  @override
  void initState() {
    super.initState();
    fetchData();
    print("2nd work");
  }

  fetchData() async {
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
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
                child:
                Text("Pokemon App"), decoration:BoxDecoration(color:Colors.greenAccent),),
            ListTile(
              title: Text("Romero Sosa Emma Yuridia", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.refresh),
      ),*/
    );
  }
}
