import 'package:flutter/material.dart';
import 'package:note_app/screen/add_note.dart';
import 'package:note_app/screen/todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Notes'),
          iconTheme: const IconThemeData(color: Colors.pink)),
      drawer: const Drawer(backgroundColor: Colors.pink),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Note",
        onPressed: () {
          const SizedBox(height: 10);
          _showAddNoteDialog(context);
        },
        child: const Icon(
          Icons.note_add,
          size: 20,
        ),
      ),
    );
  }

  void _showAddNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.pink,
        //
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNoteScreen()),
                );
              },
              child: const Text(
                "NOTE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const App()),
                );
              },
              child: const Text(
                "TO-DO",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
