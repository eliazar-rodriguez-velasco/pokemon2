import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon2/pokemon.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  title:"Pokemon App",
  home: HomePage(),
  theme: ThemeData(primarySwatch: Colors.teal),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url="https://raw.githubusercontent.com/emmaRomero19/flutter/master/pokemon/pokemon.json";
  PokeHub pokeHub;
  @override
  void initState(){
    super.initState();
    fetchData();
    print("2nd work");
  }
  fetchData()async{
    var res = await http.get(url);
    var decodedValue = jsonDecode(res.body);
    pokeHub = PokeHub.fromJson(decodedValue);
    print(pokeHub);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Pokemon App"),
        backgroundColor: Colors.cyan,
      ),

      body: GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon.map((Pokemon poke)=>Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            elevation:3.0,
            child:Column(
              children: <Widget>[
                Container(

                ),
              ],
            ),
          ),
        )).toList(),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.cyan,
        child:Icon(Icons.refresh),
      ),
    );
  }
}

