import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigator',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //inisialisasi variabel
  int _currentIndex = 0;
  String _currentMenu = 'Home';

  //method yang akan dijalankan saat di klik
  void _changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        _currentMenu = 'Home';
      } else if (index == 1) {
        _currentMenu = 'Order';
      } else if (index == 2) {
        _currentMenu = 'Inbox';
      } else if (index == 3) {
        _currentMenu = 'Account';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Menu yang aktif",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 5),
            Text(
              "Index: " + _currentIndex.toString(),
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      //membuat bottom navigator
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        //currentIndex mengikuti baris item bottom navigasi yang diklik
        currentIndex: _currentIndex,

        //warna saat diklik
        selectedItemColor: Colors.blue,

        //mtehod yang dijalankan saat ditap
        onTap: _changeSelectedNavBar,

        //agar bottom navigasi tidak bergerak saat diklik
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
