import 'package:flutter/material.dart';
import 'package:fypp/constants/images.dart';
import 'package:fypp/progress.dart';
import 'package:fypp/week1.dart';
import 'package:fypp/week2.dart';
import 'package:fypp/week3.dart';
import 'package:fypp/week4.dart';
import 'package:fypp/week5.dart';
import 'package:fypp/week6.dart';
import 'package:fypp/week7.dart';
import 'package:fypp/week8.dart';
import 'package:fypp/chatbot.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * 0.8;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Your 8 Week ACT PLAN',
            style: TextStyle(
              fontFamily: "roboto",
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 4, 182, 185),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildImageWithText(
                  context,
                  'Week 1: Grounding and Gratefulness ',
                  week1,
                  Week1Activity(),
                  imageWidth),
              _buildImageWithText(
                  context,
                  'Week 2: Understanding Thoughts and Feelings',
                  week2,
                  Week2Activity(),
                  imageWidth),
              _buildImageWithText(context, 'Week 3: Defining Values and Goals',
                  week3, Week3Activity(), imageWidth),
              _buildImageWithText(context, 'Week 4: Acceptance and Commitment',
                  week4, Week4Activity(), imageWidth),
              _buildImageWithText(
                  context,
                  'Week 5: Managing Thoughts and Emotions',
                  week5,
                  Week5Activity(),
                  imageWidth),
              _buildImageWithText(
                  context,
                  'Week 6: Progress Review and gratitude',
                  week6,
                  Week6Activity(),
                  imageWidth),
              _buildImageWithText(
                  context,
                  'Week 7: Building Resilience and Integration',
                  week7,
                  Week7Activity(),
                  imageWidth),
              _buildImageWithText(
                  context,
                  'Week 8: Integration and Moving Forward',
                  week8,
                  Week8Activity(),
                  imageWidth),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressBar(  )),
              );
            },
            child: Image.asset(bar),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Image.asset(chat),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithText(BuildContext context, String title,
      String imagePath, Widget screen, double imageWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              width: imageWidth,
              child: AspectRatio(
                aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: imageWidth,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: "roboto",
                        color: Color.fromARGB(255, 152, 8, 78),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(75, 227, 209, 222).withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
