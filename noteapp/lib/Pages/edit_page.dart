import 'package:flutter/material.dart';
import 'package:noteapp/services/database.dart';

class EditPage extends StatefulWidget {
  final int id;
  final String title;
  final String content;
  EditPage({super.key, required this.id, required this.title, required this.content,});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final DatabaseService _databaseService = DatabaseService.instance;
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _titleController.text = widget.title;
      _contentController.text = widget.content;
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: _titleController,
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
                controller: _contentController,
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
            _databaseService.updateNote(widget.id,_titleController.text,_contentController.text);
            setState(() {
              
            });
            Navigator.pushNamed(context, '/pageprincipal');
          }, 
          child: Icon(Icons.save_alt_outlined, color: Colors.white,),backgroundColor: Color.fromARGB(255, 2, 0, 31),
          ),
      );
  }
}