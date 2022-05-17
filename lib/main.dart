import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 233, 190, 186)),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int value = 0;
  int amount = 200;
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  Future<void> getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      total = localStorage.getInt('counter')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
      ),
      body: Container(
        child: Row(
          children: [
            InkWell(
                onTap: () async {
                  SharedPreferences localStorage =
                      await SharedPreferences.getInstance();
                  // int totalDecrease = 0;
                  setState(() {
                    localStorage.setInt(
                        'counter', total > amount ? total - amount : 0);
                    total = localStorage.getInt('counter')!;
                  });
                },
                child: Icon(Icons.remove)),
            Text(total.toString()),
            InkWell(
                onTap: () async {
                  SharedPreferences localStorage =
                      await SharedPreferences.getInstance();
                  setState(() {
                    localStorage.setInt('counter', total + amount);
                    total = localStorage.getInt('counter')!;
                  });
                },
                child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
