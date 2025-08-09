import 'package:flutter/material.dart';

import '../pages/login.dart';


class TimelineCard extends StatefulWidget {
  const TimelineCard({super.key});

  @override
  State<TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<TimelineCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.deepPurple.shade400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset('assets/poster1.jpeg'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Pernik HSI'),
                const SizedBox(height: 8.0,),
                Text('Info selengkapnya klik disini'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RegularCard extends StatelessWidget {
  const RegularCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.shade400,
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: Offset(0, 2),
          )
        ]
      ), 
      child: child,
    );
  }
}

class ShadowlessCard extends StatelessWidget {
  const ShadowlessCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ), 
      child: child,
    );
  }
}

class NavigasiAtas extends StatelessWidget {
  const NavigasiAtas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.0),
            child: IconButton(
              icon: Icon(Icons.account_circle),
              tooltip: 'Login',
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage())
                );
              }
            ),
          )
        ],
      ),
    );
  }
}