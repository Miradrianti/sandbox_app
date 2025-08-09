import 'package:flutter/material.dart';
import 'package:sandbox_app/components/tombol.dart';

import '../components/cards.dart';
import '../components/texts.dart';
import 'daftar.dart';
import 'login.dart';



class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        shadowColor: Colors.deepPurple.shade400,
        leading: Padding(
          padding: const EdgeInsets.all(0),
          child: Image.asset('assets/icon.jpg', width: 50, height: 50,),),
        actions: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.0),
            child: LoginButton(),
          )
        ],
        title: Text('EDU HSI'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[

              SizedBox(height: 12),

              RegularCard(child: 
                Padding(
                  padding: EdgeInsets.all(0),
                  child: HeadlineText(text: 'HSI ABDULLAH ROY'),
              )),
              const SizedBox(height: 20,),
        
              RegularCard(child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assalamualaikum,', 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    Text('Selamat datang di Aplikasi HSI Abdullah Roy'),
                  ],
                ),
              ),
        
              TimelineCard(),
        
              SizedBox(height: 16,),
        
              ShadowlessCard(child: 
                Column(
                  children: [
                    Text('Belum punya Akun?', style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    ElevatedButtonExample(
                      text: 'Mulai Daftar',
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (BuildContext context) => Daftar()),
                        );
                      },
                    ),
                  ],
                )
              ),
              
              ShadowlessCard(child:
                Column(
                  children: [
                    const Text('atau', style: TextStyle(fontWeight: FontWeight.bold),),
                    TombolText(
                      text: 'login',
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginPage())
                        );
                      }
                    ),
                  ],
                )
              ),
            ],
          ),
      ),
        bottomNavigationBar: SafeArea(
          child: Text('Copyright @2025', textAlign: TextAlign.center),
        ),
      );
  }
}
