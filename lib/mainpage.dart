import 'package:android_exam/question.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String studentID;

  MainPage({required this.studentID});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> questions =
      List<String>.generate(20, (index) => 'Question ${index + 1}');
  List<String> selectedAnswers =
      List<String>.filled(20, ''); // List to store selected answers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qeustions'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final isAnswered = selectedAnswers[index].isNotEmpty;

                return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      question,
                      style: TextStyle(
                        fontWeight:
                            isAnswered ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    subtitle: isAnswered ? Text('Answered') : null,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionPage(
                            studentID: widget.studentID,
                            question: question,
                            onAnswerSelected: (answer) {
                              setState(() {
                                selectedAnswers[index] =
                                    answer; // Update selected answer
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                _showSelectedAnswersDialog(); // Show selected answers dialog
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  void _showSelectedAnswersDialog() {
    // Build the content of the dialog
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Selected Answers:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        for (int i = 0; i < questions.length; i++)
          Text('Question ${i + 1}: ${selectedAnswers[i]}',
              style: TextStyle(fontSize: 16.0)),
      ],
    );

    // Show the dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Submission',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK', style: TextStyle(fontSize: 16.0)),
            ),
          ],
        );
      },
    );
  }
}
