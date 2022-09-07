import 'package:flutter/material.dart';
import 'package:todos_project/model/splashKomut.dart';

import '../model/sizeVariables.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size_variables sizeVariables = size_variables(MediaQuery.of(context).size.height,MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Ekranı"),
      ),
      body: Center(child: ElevatedButton(onPressed:(){
        splash(context);
      }, child: Text("Go")),)
    );
  }
}