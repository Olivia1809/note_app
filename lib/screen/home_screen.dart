import 'package:flutter/material.dart';
import 'package:note_app/screen/add_note.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(210, 125, 121, 153), Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
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
        backgroundColor: const Color.fromARGB(210, 125, 121, 153),
        //
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNoteScreen()),
                );
              },
              child: const Text(
                "NOTE",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                // Add your logic for TO-DO button
              },
              child: const Text(
                "TO-DO",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
