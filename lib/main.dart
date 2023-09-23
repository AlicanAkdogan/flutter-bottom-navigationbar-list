import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigationbar/Page1.dart';
import 'package:flutter_bottom_navigationbar/Page2.dart';
import 'package:flutter_bottom_navigationbar/Page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var sayfaListesi = [Page1(), Page2(), Page3()];
  int secilenIndeks = 1; //ilk açılacak sayfa 0 - 1 - 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: sayfaListesi[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: "1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: "2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: "3",
          ),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        currentIndex: secilenIndeks,
        onTap: (value) {
          print("Bottom NavigationBart Click");
          setState(() {
            secilenIndeks = value;
          });
        },
      ),
    );
  }
}
