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



class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text="";
  void changeText(String text){
    this.setState(() {
    this.text=text;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("To Do List")),
    body: Column(children: <Widget>[
      TextInputWidget(
      this.changeText),
      Text(this.text)
      ]));  // Scaffold sets up a regular page. Also hold other widgets
  }
}
//stful+Enter to generate statefulWidget Code
//Responsible of taking constructor
class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}
//Responsible of handling state and rendering
  @override
class _TextInputWidgetState extends State<TextInputWidget> {
  final controller= TextEditingController();
  //allow attaching to text field to manipulate data
  //force flutter to refresh. 1. Add dispose method
  void dispose(){
    super.dispose(); 
    controller.dispose();//When this widget is done, clean it up and get rid of stuff so its not loose in memory, cleaning up the object
  }
  void click(){
    //widget. reference the class TextInputWidget
    widget.callback(controller.text);
    controller.clear(); 
  }
 
  @override
  Widget build(BuildContext context) {
      return TextField(
        controller: this.controller,
        decoration:InputDecoration(
          prefixIcon: Icon(Icons.list),
          labelText:"Add A To Do List Task:",
          suffixIcon:IconButton(
          icon: Icon(Icons.save),
          splashColor: Colors.blue,
          tooltip: "Save To Do List",
          onPressed: this.click, //tell us what to do when button pressed
          )));
           //making arrow function. Text is passed to another function
      
      
  }
}

// class TestWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//    return Text("Hello World");
//   }
// }