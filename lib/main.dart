import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application Myapp. Extends a statelessWidget(not have state/unchanging)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //sets the app for us- MaterialApp
      title: 'ToDoList',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("To Do List")),
    body: TextInputWidget());  // Scaffold sets up a regular page. Also hold other widgets
  }
}
//stful+Enter to generate statefulWidget Code
//Responsible of taking constructor
class TextInputWidget extends StatefulWidget {
  const TextInputWidget({ Key? key }) : super(key: key);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}
//Responsible of handling state and rendering
  @override
class _TextInputWidgetState extends State<TextInputWidget> {
  final controller= TextEditingController();
  String text=""; //allow attaching to text field to manipulate data
  //force flutter to refresh. 1. Add dispose method
  void dispose(){
    super.dispose(); 
    controller.dispose();//When this widget is done, clean it up and get rid of stuff so its not loose in memory, cleaning up the object
  }
  void changeText(text){
    if (text=="Hello World"){
      controller.clear();
      text="";
      //clears textfield if inputted "Hello World"
    }
    //force flutter to refresh and change by using setstate
    setState(() {
     this.text=text; 
    });
  }
  @override
  Widget build(BuildContext context) {
      return Column(
        children:<Widget>[TextField(
        controller: this.controller,
        decoration:InputDecoration(
          prefixIcon: Icon(Icons.list),labelText:"Add A To Do List Task:"),
          onChanged:(text) => changeText(text) , //making arrow function. Text is passed to another function
      ), Text(this.text)
      ]);
  }
}

// class TestWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//    return Text("Hello World");
//   }
// }