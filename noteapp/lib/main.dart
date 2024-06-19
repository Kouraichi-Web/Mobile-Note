import 'package:flutter/material.dart';
import 'package:noteapp/Pages/corbeille.dart';
import 'package:noteapp/Pages/setting.dart';
import 'package:noteapp/page_principal.dart';


import 'Pages/new_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
 const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PagePrincipal(),
      routes: {
        '/pageprincipal': (context) => PagePrincipal(),
        '/setting': (context) => SettingPage(),
        '/corbeille': (context) => CorbeillePage(),
        '/newpage': (context) => NewPage(),
      },
        
    );

      }
  }  