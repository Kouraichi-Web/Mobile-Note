import 'package:flutter/material.dart';
import 'package:noteapp/services/database.dart';
import 'package:noteapp/utils/dropdrown.dart';
import 'package:noteapp/utils/note_liste.dart';

// ignore: must_be_immutable
class PagePrincipal extends StatelessWidget {

  
final DatabaseService _databaseService = DatabaseService.instance;

  PagePrincipal({super.key});

  List listeNote = [
    {'title':'note 1', 'content':'List of content', 'color': Colors.blue},
    {'title':'note 2', 'content':'List of content', 'color': Colors.yellow},
    {'title':'note 3', 'content':'List of content', 'color': Colors.red},
  ];
  


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 48, 48) ,
        appBar:  AppBar(title: Text("Principal", style:TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.share,),
          onPressed: () {},
          )
        ],
        
        backgroundColor: Color.fromARGB(255, 2, 0, 31),
        iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer:  Drawer(
          backgroundColor: Color.fromARGB(255, 2, 0, 31),
          child: Column(
            children: [
              DrawerHeader(child: Text("Menu",style:TextStyle(color: Colors.white, fontSize: 30),),),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.white,),
                title: const Text("R é g l a g e",style:TextStyle(color: Colors.white)),
                onTap: (){
                  Navigator.pushNamed(context, '/setting');
                },
              ),

               ListTile(
                leading: Icon(Icons.delete_forever_rounded,color: Colors.white,),
                title: Text("C o r b e i l l e",style:TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, '/corbeille');
                },
              ),
             
               
            ],
            
          ),
        ),
        
      body: ListView(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
                style: TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                hintText: "search notes",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                fillColor: Colors.grey.shade800,
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.transparent),
                )
              ),
            ),
        ),
        Expanded(child: GridView.builder(
          itemCount: listeNote.length,
          shrinkWrap: true, 
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index)=> Container(
          color: listeNote[index]['color'],
          margin: EdgeInsets.all(20),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(listeNote[index]['title'],style: TextStyle(fontSize: 20,),),
                  DropDown()
                ],
              ),
            ),
            Divider(),
            Text(listeNote[index]['content']),
            
          ],),
        )))
       ],
       ),
      
        floatingActionButton: FloatingActionButton(onPressed: () {Navigator.pushNamed(context, '/newpage');}, child: Icon(Icons.add,color: Colors.white,), backgroundColor: Color.fromARGB(255, 2, 0, 31),
      ),
    );
  }
}