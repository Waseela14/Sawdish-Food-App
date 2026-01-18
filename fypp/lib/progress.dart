import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final databaseRef = FirebaseDatabase.instance.ref('user_feedback');

  ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserEmail = FirebaseAuth.instance.currentUser?.email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress',
            style: TextStyle(
              fontSize: 24,
            )),
      ),
      body: StreamBuilder(
        stream: databaseRef.onValue, // Listen for changes in the database
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Show a loading indicator while waiting
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Display error if there's any
          } else if (!snapshot.hasData ||
              snapshot.data!.snapshot.value == null) {
            return const Center(
                child: Text(
                    'No feedback available.')); // Display a message if no data is found
          } else {
            final feedbackList = snapshot.data!.snapshot.children.toList();

            final filteredFeedbackList = feedbackList.where((feedbackItem) {
              final feedback = feedbackItem.value as Map<dynamic, dynamic>;
              return feedback['user'] == currentUserEmail;
            }).toList();

            return ListView.builder(
              itemCount: filteredFeedbackList.length,
              itemBuilder: (context, index) {
                final feedback =
                    filteredFeedbackList[index].value as Map<dynamic, dynamic>;
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(feedback['feedback'] ?? 'No feedback'),
                    subtitle: Text(feedback['user'] ?? 'Anonymous'),
                    trailing: Text(feedback['week'] ?? 'Week 1'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
