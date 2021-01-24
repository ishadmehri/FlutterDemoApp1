import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int current_item = 0;
  int iman = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page")
      ),
      body: Center(
        child: Text(
          "شما روی دکمه $iman بار کلیک کردید!",
        textDirection: TextDirection.rtl,),

      ),
      bottomNavigationBar: BottomAppBar(

        shape: const CircularNotchedRectangle(
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(title: Container(
              height: 10,
            ),icon: Icon( Icons.home_filled)),
            BottomNavigationBarItem(title: Container(
              height: 10,
            ),icon: Icon( Icons.home_filled)),
          ],
          currentIndex: current_item,
          onTap: (index)=>setState(
              (){
                current_item = index;
              },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfffeab02),
        onPressed: ()=>setState(
            (){
              iman--;
            }
        ),
        child: Icon(
          Icons.mic
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
