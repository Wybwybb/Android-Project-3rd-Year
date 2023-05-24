import 'package:flutter/material.dart';
import 'mainpage.dart';
import 'connection.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final Connection connection = Connection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branzuela, Raymond Benedict'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 134, 244),
              Color.fromARGB(255, 254, 237, 0)
            ], // Customize the gradient colors here
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter your ID Number', // Added text above the text field
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Student ID',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    final String studentID = idController.text;
                    try {
                      final loginData =
                          await connection.getLoginData(studentID);
                      // Process the login data here

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(studentID: loginData),
                        ),
                      );
                    } catch (e) {
                      // Handle any errors during login data retrieval
                      print('Login failed: $e');
                      // Show an error dialog or display an error message
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
