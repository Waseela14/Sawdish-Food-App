import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fypp/constants/images.dart';
import 'package:fypp/signup/signup_screen.dart';
import 'package:firebase_database/firebase_database.dart';

class Week1Activity extends StatelessWidget {
  final databaseRef = FirebaseDatabase.instance.ref('user_feedback');

  final List<Map<String, String>> activities = [
    {
      'image': gratitude,
      'title': 'Start a Gratitude Journal',
    },
    {
      'image': mindfulwalking,
      'title': 'Mindful Walking',
    },
    {
      'image': mindfulwalking_1,
      'title': 'Don\'t feel rushed',
    },
    {
      'image': mindfulwalking_2,
      'title': 'How about a nature walk?',
    },
    {
      'image': mindfulwalking_3,
      'title': 'Observe your surroundings.',
    },
    {
      'image': mindfulwalking_4,
      'title': 'Feel the sensation of legs',
    },
    {
      'image': mindfulwalking_5,
      'title': 'Engage your senses',
    },
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Week 1: Grounding and Gratefulness',
          style: TextStyle(
            fontFamily: "roboto",
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 16, 200, 203),
          ),
          textAlign: TextAlign.center, // Center the title
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              activity['title']!,
                              style: const TextStyle(
                                fontFamily: 'roboto',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Image.asset(activity['image']!),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 50.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Have You Completed Week 1? We Love your feedback!',
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                hintText: 'Enter your feedback',
                controller: feedbackController,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                  onNext: () {
                    if (feedbackController.text.isEmpty) {
                      return;
                    } else {
                      try {
                        databaseRef.push().set({
                          'feedback': feedbackController.text,
                          'user': FirebaseAuth.instance.currentUser!.email,
                          'week': 'week1',
                        }).then((_) {
                          feedbackController.clear();
                          var snackBar = const SnackBar(
                            content: Text('Feedback submitted successfully!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      } catch (e) {
                        print('error is thiiiiiiiiiiiiiiiiis $e');
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        // );
                      }
                    }
                  },
                  text: 'Submit',
                  color: const Color.fromARGB(113, 217, 14, 14),
                  googleButton: false,
                  textColor: Colors.white),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
