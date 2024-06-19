import 'package:flutter/material.dart';


class Dialog_Box extends StatelessWidget {
  const Dialog_Box({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Title(color: Colors.white, child: Text("Sécurité",style:TextStyle(color: Colors.white),), ),
      backgroundColor: Color.fromARGB(255, 4, 0, 32),
      content: Container(
        height: 120,
        ),
    );
  }
}