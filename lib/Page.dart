import 'package:flutter/material.dart';

class  NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}


class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Main Page',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text('Hello'),
          ),
          body: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.amber, Colors.cyanAccent])),
                child: Center(
                  child: Image.asset("assets/images/Screenshot 2022-02-12 034733.jpg"),
                ),

              )


          ),

        ));
  }
}
