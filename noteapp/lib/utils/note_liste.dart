import 'package:flutter/material.dart';

class NoteListe extends StatelessWidget {
  const NoteListe({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index)=>Container(
      // color: Colors.red,
      margin: EdgeInsets.all(8),
      
    ));
  }
}