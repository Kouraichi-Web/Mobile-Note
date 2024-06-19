import 'package:flutter/material.dart';

import 'dialog_box.dart';

class SettingPage extends StatefulWidget {
  const SettingPage ({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void openDialog(){
    showDialog(context: context, builder: (context){
      return Dialog_Box();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 48, 48, 48) ,
       appBar: AppBar(title: Text("Reglage",style:TextStyle(color: Colors.white),),
       centerTitle: true,
       backgroundColor: Color.fromARGB(255, 2, 0, 31),
       iconTheme: IconThemeData(color: Colors.white),
       ),
       body: Padding(
         padding: const EdgeInsets.all(10),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Text("Onglet", style: TextStyle(fontSize: 20, color: Colors.white,)),
            
            TextButton(onPressed: () {Navigator.pushNamed(context, '/pageprincipal');}, 
            child: Text("Principal", style: TextStyle(fontSize: 18, color: Colors.white,)),),

            TextButton(onPressed: () {Navigator.pushNamed(context, '/corbeille');}, 
            child: Text("Corbeille", style: TextStyle(fontSize: 18, color: Colors.white,)),),

             TextButton(onPressed: openDialog, 
            child: Text("Sécurité", style: TextStyle(fontSize: 18, color: Colors.white,)),
            ),
            
             
          ],
         ),
       ),
    );
  }
}