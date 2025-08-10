import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sandbox_app/components/tombol.dart';
import 'package:sandbox_app/pages/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/cards.dart';
import '../components/texts.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String text = "";
  String jk = "";

  @override
  void initState() {
    super.initState();
    _loadProfil();
  }

  Future<void> _loadProfil() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString("profil");

    if (jsonString == null) {
      //final data = jsonDecode(jsonString);
      setState(() {
        text = "";
        jk = "";
      });
      return;
    }

    final data = jsonDecode(jsonString);
    setState(() {
      text = data["nama"] ?? "Belum diisi";
      jk = data["jenisKelamin"] ?? "Belum diisi";
    });
  }

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

              RegularCard(child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama: $text'),
                    Text('Jenis Kelamin: $jk')
                  ],
                )
              ),

              const SizedBox(height: 20,),

              TombolText(
                text: 'Logout', 
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LandingPage()));
                },
              )

            ]
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Text('Copyright @2025', textAlign: TextAlign.center),
      ),
    );
  }
}