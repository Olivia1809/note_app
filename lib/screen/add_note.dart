import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note of Choice'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child:Column(
          children: [
            const TextField(
              decoration:  InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.black),
              ),
          ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Note')
            ),
          ],
        ), 
      ),
    );
  }
}