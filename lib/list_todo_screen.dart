import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});
  @override
  TodoListScreenState createState() => TodoListScreenState();
}

class TodoListScreenState extends State<TodoListScreen> {
  // Inisiasi variable :
  // List = array ,
  // Map = Object (param pertama untuk type data key nya <String , param kedua untuk type data value nya dynamic>)
  List<Map<String, dynamic>> listTodo = [
    {"id": 123, "title": "Belajar flutter", "priority": "High"},
    {"id": 234, "title": "Main fifa", "priority": "Low"},
    {"id": 456, "title": "Scroll youtube", "priority": "Low"}
  ];

  // Membuat fungsi / handler untuk menambahkan list ke todoList
  void _addItemTodo() {
    // Kalau panggil langsung tanpa setState() maka ui tidak akan melakukan re-render
    // listTodo
    //     .add({"id": 678, "title": "Ini tambahan todo", "priority": "Medium"});
    // Yang tepat gunakan setState() untuk mengupdate variable
    setState(() {
      listTodo
          .add({"id": 678, "title": "Ini tambahan todo", "priority": "Medium"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo List Screen"),
        ),
        body: Column(
          children: [
            const Text("List Todo"),
            Expanded(
                child: ListView(
              children: listTodo
                  .map((item) => ListTile(
                        title: Text(item["title"]),
                        subtitle: Text("Priority: ${item["priority"]}"),
                      ))
                  .toList(),
            )),
            ElevatedButton(
                onPressed: _addItemTodo, child: const Text("Add Item"))
          ],
        )
        // body: ListView(
        //   children: listName
        //       .map((item) => ListTile(
        //             title: Text(item["city"]),
        //             subtitle: Text(item["city"]),
        //           ))
        //       .toList(),
        // )
        // body: ListView.builder(
        //     itemCount: listName.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return ListTile(
        //         title: Text(listName[index]['name']),
        //         subtitle: Text(listName[index]['city']),
        //       );
        //     }),
        );
  }
}
