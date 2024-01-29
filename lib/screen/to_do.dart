import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Todo App with Re-orderable Lists & Swipe Cards",
    home: App(),
  ));
}

List<TodoItem> items = [
  TodoItem("Purse"),
  TodoItem("Make-up"),
];

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
        color: todoToggle ? Colors.white : Colors.black,
        fontStyle: todoToggle ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  final TextEditingController _appBarTitleController = TextEditingController();

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
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ReorderableListView(
        children: <Widget>[
          for (var item in items)
            ListTile(
              key: Key(item.text),
              title: Row(
                children: [
                  Checkbox(
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
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            var getReplacedWidget = items.removeAt(oldIndex);
            items.insert(newIndex, getReplacedWidget);
          });
        },
      ),
    );
  }
}
