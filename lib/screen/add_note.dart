import 'package:flutter/material.dart';
import 'package:note_app/screen/home_screen.dart';

class AddNoteScreen extends StatefulWidget {
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
          padding: const EdgeInsets.all(16.0),
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
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined, //Back arrow
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  const Text(
                    "Notes",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(210, 251, 253, 255),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  IconButton(
                    color: const Color.fromARGB(210, 251, 253, 255),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.delete_rounded, //Back arrow
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
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Type something',
                          //labelStyle: TextStyle(color: Colors.black),
                        ),
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
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
