import 'package:flutter/material.dart';
import 'package:note_app/screen/add_note.dart';
//import 'package:note_app/screen/add_note.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            onPressed: () {
              /* showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              ); */
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      /*  body: const Padding(
        padding: EdgeInsets.all(8.0),
      ) */
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Note",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNoteScreen()),
          );
        },
        child: const Icon(
          Icons.note_add,
          //color: Theme.of(context).colorScheme.background,
          size: 30,
        ),
      ),
    );
  }
  /*  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNoteScreen()));
            },
            child: const Text(
              "NOTE",
              style: TextStyle(fontSize: 54, fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "TO-DO",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
      //shape: ,
      //backgroundColor: const Color.fromARGB(255, 3, 34, 4),
    );
  } */
}
