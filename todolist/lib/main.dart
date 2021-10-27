import 'package:flutter/material.dart';
// import 'package:layout/pages/contact.dart';
// import 'package:layout/pages/home.dart';
// import 'package:layout/pages/search.dart';
import 'package:todolist/pages/add.dart';
import 'package:todolist/pages/todolist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TodoList",
      home: Todolist(),
    );
  }
}

class MainPage extends StatefulWidget {
  //const MainPage({ Key? key }) : super(key: key);
  //
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [AddPage(), Todolist()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('เเอพคำนวณ')),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue), label: "หน้าแรก"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.blue),
              label: "รายการทั้งหมด"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.search, color: Colors.blue), label: "ค้นหา"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.contact_phone, color: Colors.blue),
          //     label: "ติดต่อเรา"),
        ],
        onTap: (index) {
          setState(() {
            //print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
