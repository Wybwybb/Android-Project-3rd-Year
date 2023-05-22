import 'package:android_exam/main.dart';
import 'package:flutter/material.dart';

import 'mainpage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Branzuela, Raymond Benedict'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your ID Number', // Added text above the text field
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Student ID',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  final String studentID = idController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(studentID: studentID),
                    ),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18.0),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
