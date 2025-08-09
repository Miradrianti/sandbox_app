import 'package:flutter/material.dart';

import '../components/cards.dart';
import '../components/texts.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        shadowColor: Colors.deepPurple.shade400,
        leading: Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back))),
        actions: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.0),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              SizedBox(height: 12),
              RegularCard(
                    child: Column(
                      children: <Widget>[
                        HeadlineText(text: 'Profil'),
                      ],
                    ),
              ),
              const SizedBox(height: 20,),
            ]
        ),
      ),
    );
  }
}