import 'package:flutter/material.dart';


class Dialog_Box extends StatelessWidget {
  const Dialog_Box({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Title(color: Colors.white, child: Text("Sécurité",style:TextStyle(color: Colors.white),), ),
      backgroundColor: Color.fromARGB(255, 14, 0, 104),
      content: Container(
        height: 230,
        child: Column(
          children: [
                TextField(style: TextStyle(color: Colors.white),decoration: InputDecoration(labelText: "Ancienne mot de passe", hintStyle: TextStyle(color: Colors.white30), ),),
                TextField(style: TextStyle(color: Colors.white),decoration: InputDecoration(labelText: "Nouveau mot de passe", hintStyle: TextStyle(color: Colors.white30)),),
                TextField(style: TextStyle(color: Colors.white),decoration: InputDecoration(labelText: "Confirmer le mot de passe", hintStyle: TextStyle(color: Colors.white30)),),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text("Valider")),
                ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Annuler")),
                  ],
                ),
          ],
        ),
        ),
    );
  }
}