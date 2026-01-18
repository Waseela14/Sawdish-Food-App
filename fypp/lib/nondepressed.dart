import 'package:flutter/material.dart';
import 'package:fypp/chatbot.dart';
import 'package:fypp/constants/images.dart'; // Ensure this import is correct based on your file structure

class NonDepressedScreen extends StatelessWidget {
  const NonDepressedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            nondepressed, // Replace with your image path
            fit: BoxFit.contain,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()), // Ensure this is correct
          );
        },
        child: Image.asset(chat),
       
      ),
    );
  }
}


