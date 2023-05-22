import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  final String studentID;
  final String question;
  final ValueChanged<String> onAnswerSelected;

  const QuestionPage(
      {required this.studentID,
      required this.question,
      required this.onAnswerSelected});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  String? selectedAnswer; // Track the selected answer

  @override
  Widget build(BuildContext context) {
    final List<String> choices = [
      'Choice A',
      'Choice B',
      'Choice C',
      'Choice D'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question: ${widget.question}',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Choices:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: choices.map((choice) {
                return ListTile(
                  title: Text(choice),
                  tileColor: selectedAnswer == choice
                      ? Colors.blueAccent
                      : Colors.grey[200],
                  onTap: () {
                    setState(() {
                      selectedAnswer = choice; // Update the selected answer
                    });
                    widget.onAnswerSelected(choice);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
