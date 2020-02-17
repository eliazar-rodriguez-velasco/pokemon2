import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  @override
  void initState(){
    super.initState();
    fetchData();
    print("2nd work");
  }
  fetchData()async{

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Pokemon App"),
        backgroundColor: Colors.cyan,
      ),

      body:Center(
        child: Text("Hello Yuri"),

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

