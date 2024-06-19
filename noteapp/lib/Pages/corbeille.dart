import 'package:flutter/material.dart';

class CorbeillePage extends StatelessWidget {
  const CorbeillePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 48, 48, 48) ,
      appBar: AppBar(title: Text("CORBEILLE",style:TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 2, 0, 31),
      iconTheme: IconThemeData(color: Colors.white),

      

      ),
        floatingActionButton: FloatingActionButton( 
        onPressed: () {}, 
        child: Icon(Icons.restore, color: Colors.white,),backgroundColor: Color.fromARGB(255, 2, 0, 31),
        ),
        
        
        
    );
  }
}