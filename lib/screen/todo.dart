import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: App(),
  ));
}

class TodoItem {
  String text;
  bool isDone;

  TodoItem(this.text, {this.isDone = false});
}

class StrikeThrough extends StatelessWidget {
  final String todoText;
  final bool todoToggle;

  const StrikeThrough({
    super.key,
    required this.todoText,
    required this.todoToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      todoText,
      style: TextStyle(
        fontSize: 20.0,
        decoration:
            todoToggle ? TextDecoration.lineThrough : TextDecoration.none,
        //color: todoToggle ? Colors.white : Colors.white,
        color: Colors.white,
        fontStyle: todoToggle ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  List<TodoItem> items = [];
  final TextEditingController _appBarTitleController = TextEditingController();
  final TextEditingController _newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TextField(
          controller: _appBarTitleController,
          decoration: const InputDecoration(
            hintText: 'Title',
          ),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.pink),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(
              Icons.delete_outline_rounded,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Your existing list view
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return ListTile(
                  key: Key(item.text),
                  title: Row(
                    children: [
                      Checkbox(
                        checkColor: const Color.fromARGB(255, 247, 10, 168),
                        value: item.isDone,
                        onChanged: (value) {
                          setState(() {
                            item.isDone = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: StrikeThrough(
                          todoText: item.text,
                          todoToggle: item.isDone,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // New todo input field and button
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autocorrect: true,
                    controller: _newTodoController,
                    decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 247, 10, 168),
                        iconColor: Color.fromARGB(255, 247, 10, 168)),
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  onPressed: () {
                    _addTodo();
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.pink,
                  ),
                ),
                /*  ElevatedButton(
                  onPressed: () {
                    _addTodo();
                  },
                  child: const Text('Add Todo'),
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addTodo() {
    String newTodoText = _newTodoController.text;
    if (newTodoText.isNotEmpty) {
      setState(() {
        items.add(TodoItem(newTodoText));
        _newTodoController.clear();
      });
    }
  }
}
