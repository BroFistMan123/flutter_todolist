import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class ToDoList{
  String body;
  String title;
  bool finished= false;
  ToDoList(this.title, this.body);

  void changeFinish(){
    this.finished=!this.finished;
    if(this.finished){
      this.finished=true;
    }else{
      this.finished=false;
    }
  }

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
  List<ToDoList> todolist=[];
  void newToDoList(String text){
    this.setState(() {
    todolist.add(new ToDoList(text,"Distributive Computing"));
    
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("To Do List")),
    body: Column(children: <Widget>[
    Expanded(child: ToDoList_list(this.todolist)),
    TextInputWidget(this.newToDoList)
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
    FocusScope.of(context).unfocus();
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

class ToDoList_list extends StatefulWidget {

final List<ToDoList> listItems;
ToDoList_list(this.listItems);

@override  
  _ToDoList_listState createState() => _ToDoList_listState();
}

class _ToDoList_listState extends State<ToDoList_list> {
  void finish(Function callback){
    this.setState(() {
      callback();
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:this.widget.listItems.length,
      itemBuilder: (context,index){
        var todolists=this.widget.listItems[index]; //Tells builder how many items its gonna store
        return Card(
          child:Row(children: <Widget>[
          Expanded(
          child: ListTile(
          title:Text(todolists.title),
          subtitle:Text(todolists.body)
        )),
        Row(
        children: <Widget>[
        Container(
        child: Text("Completed",
        style:TextStyle(fontSize:13)),
        padding:EdgeInsets.fromLTRB(0, 0, 5, 0)
        ),
          IconButton(icon: 
        Icon(Icons.radio_button_unchecked),
        onPressed:() => this.finish(todolists.changeFinish),
        color: todolists.finished ? Colors.blue : Colors.black)
        ],
        )]
        ));
      },
    );
  }
}

// class TestWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//    return Text("Hello World");
//   }
// }