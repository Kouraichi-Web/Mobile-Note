import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/services/database.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final DatabaseService _databaseService = DatabaseService.instance;

  late String _title;
  late String _content ;

  // My functions
  String GenerateCurrentDate(){
    final DateFormat formatter = DateFormat("yyyy - MM - dd");
    DateTime now = DateTime.now();
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        print('return clicked');

        return Future.value(false);
      },
      child: Scaffold(
        appBar:  AppBar(title: Text("Notes",style:TextStyle(color: Colors.white),),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.share),
            onPressed: () {},
            )
          ],
          backgroundColor: Color.fromARGB(255, 2, 0, 31),
      
          iconTheme: IconThemeData(color: Colors.white),
      
          ),
      
          body: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  _title = value;
                },
                 style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                    hintText: "Titre",
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  _content = value;
                },
                 style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                    hintText: "Description",border: InputBorder.none,),
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 50,
              ),
            )
            
          ],),
      
         backgroundColor: Color.fromARGB(255, 48, 48, 48) ,
         
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            _databaseService.addNote(_content, _title, GenerateCurrentDate());
            Navigator.pushNamed(context, '/pageprincipal');
          }, 
          child: Icon(Icons.save_alt_outlined, color: Colors.white,),backgroundColor: Color.fromARGB(255, 2, 0, 31),
          ),
      ),
    );
  }
}