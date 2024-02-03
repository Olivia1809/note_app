import 'package:flutter/material.dart';
import 'package:note_app/screen/home_screen.dart';

class AddNoteScreen extends StatefulWidget {
  static const String routeName = '/addNote';
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    color: const Color.fromARGB(210, 251, 253, 255),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    icon: const Icon(Icons.arrow_back_ios_outlined,
                        size: 20,
                        color: Color.fromARGB(255, 247, 10, 168) //Back arrow
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  const Text(
                    "Notes",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  IconButton(
                    color: const Color.fromARGB(255, 247, 10, 168),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.delete_rounded, //Back arrow
                      size: 20,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: null,
                        autofocus: true,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Title',
                          //labelStyle: TextStyle(color: Colors.black),
                        ),
                        style: const TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Type something',
                          fillColor: Colors.white,
                          //labelStyle: TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(
                            fontSize: 18.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
