import 'package:flutter/material.dart';
import 'package:sandbox_app/dummy/siswa.dart';
import 'package:sandbox_app/pages/data_siswa.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/cards.dart';
import '../components/texts.dart';
import 'beranda.dart';

class InputSiswa extends StatefulWidget {
  const InputSiswa({super.key});

  @override
  State<InputSiswa> createState() => _InputSiswaState();
}

class _InputSiswaState extends State<InputSiswa> {
  final TextEditingController _nama = TextEditingController();

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('siswa',siswa);
  }
  void tambahSiswa() {
    final namaBaru = _nama.text.trim();

    if (namaBaru.isEmpty || namaBaru.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nama tidak boleh kosong & harus terdiri dari 3 karakter atau lebih!')),
      );
      return;
    }  
    setState(() {
      siswa.add(namaBaru); // Masukkan ke list
    });
    saveData();
    _nama.clear(); // Kosongkan textfield
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Beranda()));
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
                        HeadlineText(text: 'Input Siswa'),
                      ],
                    ),
              ),

              const SizedBox(height: 20,),

              RegularCard(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nama,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                      ),
                    ),
                  ],
                )
              ),

              const SizedBox(height: 20,),

              ShadowlessCard(child:
                ElevatedButton(
                    onPressed: () async {
                        setState(() {
                          tambahSiswa();
                        });
                        saveData();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DataSiswa()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade400,
                      foregroundColor: Colors.white,
                      elevation: 8.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: const Text('Tambahkan Siswa'),
                )
              ),


            ]
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Text('Copyright @2025', textAlign: TextAlign.center),
      ),
    );
  }
}