import 'dart:html';
import 'package:flutter/material.dart';
import 'package:hw_ix/Page.dart';

class Pin extends StatefulWidget {
  static const buttonSize = 60.0;

  const Pin({Key? key}) : super(key: key);

  @override
  State<Pin> createState() => _PinState();
}
class _PinState extends State<Pin> {
  var _pin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.grey,
                ),
                Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Eenter PIN to login',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < _pin.length; i++)
                    Container(
                      width: 20.0,
                      height: 20.0,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF99ffd6),
                        shape: BoxShape.circle,
                      ),
                    ),
                  for (var i = 0; i < 6 - _pin.length; i++)
                    Container(
                      width: 20.0,
                      height: 20.0,
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff00ff99),
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(1),
                      _buildButton(2),
                      _buildButton(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(4),
                      _buildButton(5),
                      _buildButton(6),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(7),
                      _buildButton(8),
                      _buildButton(9),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(-2),
                      _buildButton(0),
                      _buildButton(-1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (num == -1) {
            print('Backspace');

            setState(() {
              // '12345'
              var length = _pin.length;
              _pin = _pin.substring(0, length - 1);
            });
          } else {
            if (_pin.length < 6)
              setState(() {
                _pin = '$_pin$num';
              });
            if (_pin.length == 6) {
              if (_pin == '123456') {
                _pin = "";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewPage()),
                );
              } else {
                showMaterialDialog(
                    context, "Incorrect PIN", "Please try again");
                _pin = "";
              }
            }
            print('You pressed $num');
          }
        },
        borderRadius: BorderRadius.circular(Pin.buttonSize / 2),
        child: Container(
          decoration: (num == -1)
              ? null
              : BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.lightBlueAccent.shade400),
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          alignment: Alignment.center,
          width: Pin.buttonSize,
          height: Pin.buttonSize,
          // conditional operator (?:)
          child: (num == -1)

              ? Icon(Icons.backspace_outlined,color: Colors.lightBlueAccent.shade100)
              : Text(
            '$num',
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
    );
  }

  void showMaterialDialog(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

