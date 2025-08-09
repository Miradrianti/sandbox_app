import 'package:flutter/material.dart';

import '../pages/login.dart';
import '../pages/profil.dart';

class ElevatedButtonExample extends StatelessWidget {
  const ElevatedButtonExample({
    super.key, 
    required this.text, 
    required this.onPressed
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 16),
      backgroundColor: Colors.deepPurple.shade400,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style, 
            onPressed: onPressed,
            child: Text(text)),
        ],
      ),
    );
  }
}

class TombolText extends StatelessWidget {
  const TombolText({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class ProfilButton extends StatelessWidget {
  const ProfilButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle),
      tooltip: 'Profil',
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Profil())
        );
      }
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle),
      tooltip: 'Login',
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginPage())
        );
      }
    );
  }
}