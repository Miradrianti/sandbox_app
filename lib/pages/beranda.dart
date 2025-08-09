import 'package:flutter/material.dart';
import 'package:sandbox_app/components/tombol.dart';
import 'package:sandbox_app/pages/data_siswa.dart';

import '../components/cards.dart';
import '../components/texts.dart';



class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {

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
            child: ProfilButton(),
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
              
              SizedBox(height: 20,),
        
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

              SizedBox(height: 20,),

              RegularCard(child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Navigasi'),
                    const Divider(height: 20, thickness: 2, indent: 0, endIndent: 0, color: Color.fromARGB(255, 178, 161, 207),),
                    TombolText(
                      text: '> Daftar Siswa',
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const DataSiswa())
                        );
                      }
                    ),
                  ],
                )
              ),
        
              SizedBox(height: 20,),

            ],
          ),
      ),
        bottomNavigationBar: SafeArea(
          child: Text('Copyright @2025', textAlign: TextAlign.center),
        ),
      );
  }
}
