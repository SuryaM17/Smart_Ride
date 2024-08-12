import 'package:flutter/material.dart';
import 'login_register.dart';

// ignore: use_key_in_widget_constructors
class LanguageSelectionScreen extends StatelessWidget {
  final List<String> languages = ['English', 'Tamil', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // This will go back to the previous screen
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white70, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: languages.length,
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      languages[index],
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    _navigateToLogin(context);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}