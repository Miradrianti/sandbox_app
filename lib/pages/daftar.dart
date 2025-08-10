/*
Halaman 2: Formulir Pendaftaran Formulir terdiri dari: 
a. TextField untuk input Nama Lengkap 
b. Radio untuk memilih Jenis Kelamin (Laki-laki / Perempuan) 
c. Checkbox untuk menyatakan "Saya bersedia mengikuti seluruh program" 
d. Switch untuk memilih apakah ingin menerima notifikasi pengingat 
e. Tombol Submit, Saat tombol ditekan: Validasi bahwa nama tidak kosong 
dan checkbox dicentang
f. Tampilkan SnackBar dengan ringkasan input yang telah diisi
g. Setelah 2 detik, kembalikan ke halaman utama (HomePage)
*/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sandbox_app/components/cards.dart';
import 'package:sandbox_app/components/texts.dart';
import 'package:sandbox_app/pages/beranda.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Daftar extends StatefulWidget {
  const Daftar({super.key});
  

  @override
  // ignore: library_private_types_in_public_api
  _DaftarState createState() => _DaftarState();
}
 
class _DaftarState extends State<Daftar> {
final _usernameController = TextEditingController();

String? _character; //radiobutton
bool isChecked = false; //checkbox
bool light = true; //switch

Future<void> _shocwSnackBar() async {
  final text = _usernameController.text.trim();
  final jk = _character;
  
  //validasi
  if (text.isEmpty || _character == null || !isChecked) {
    String errorMessage = 'Kamu belum melengkapi data diri:\n';

    if(text.isEmpty) errorMessage += '- Silahkan masukkan nama Kamu\n';
    if(_character == null ) errorMessage += '- Pilih Jenis Kelamin\n';
    if(!isChecked) errorMessage += '- Centang kesediaan untuk mendaftar';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
    return;
  }

  final prefs = await SharedPreferences.getInstance();

  final profil = {
    "nama" : text,
    "jenisKelamin": jk
  };

  await prefs.setString("profil", jsonEncode(profil));

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        """
        Selamat! Kamu berhasil terdaftar dengan data diri:
        Nama Lengkap: $text & Kamu seorang: $jk
        """),
        duration: Duration(seconds: 2),
    ),
  );

  _usernameController.clear();
  setState(() {
    _character = null;
    isChecked = false;
  });
}

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveState = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
      };
      if (states.any(interactiveState.contains)) {
        return Colors.deepPurple.shade100;
      }
      return Colors.deepPurple;
    }

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
                        Image.asset('assets/icon.jpg',
                          width: 100,
                          height: 100,
                        ),
                        HeadlineText(text: 'Form Pendaftaran Santri'),
                      ],
                    ),
                  ),
              const SizedBox(height: 20,),

              SizedBox(width: 50,),
                  //a. Textfield
              RegularCard(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
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
              
              const SizedBox(height: 20.0),
              //b. Pilihan Radio

              RegularCard(child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Jenis Kelamin',style: TextStyle(fontSize:14),),
                    ListTile(
                    title: const Text('Laki-laki', style: TextStyle(fontSize: 14),),
                    leading: Radio<String>(
                      value: 'Laki-laki',
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: ListTile(
                      title: const Text('Perempuan',style: TextStyle(fontSize: 14),),
                      leading: Radio<String>(
                        value: "Perempuan",
                        groupValue: _character,
                        onChanged: (value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                  ],
                )
              ),
          
              const SizedBox(height: 20.0),
              //c. Checkbox
              RegularCard(child:
                Column(
                  children: [
                    FormField<bool>(
                      builder: (state) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Flexible(child: Text('Saya setuju untuk mengikuti seluruh program')),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: WidgetStateProperty.resolveWith(getColor),
                                  overlayColor: WidgetStateProperty.resolveWith(getColor),
                                  value: isChecked,
                                  onChanged: (bool? value){
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                              ],
                            ),
                          ],
                        );
                      },
                      validator: (value) {
                        if(!isChecked) {
                          return 'Data Belum lengkap';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                )
              ),
              
              const SizedBox(height: 20.0),
              
              //d. Tombol Switch
              RegularCard(child:
                Row(
                  children: [
                    Flexible(child: Text('Saya ingin menerima notifikasi pengingat')),
                    Switch(
                      value: light,
                      activeColor: Colors.deepPurple,
                      onChanged: (bool value) {
                        setState(() {
                          light = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20.0), 

              //e. Tombol Submit + Tombol Clear
              ShadowlessCard(child: 
                Column(
                  children: [
                    OverflowBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      if ( _usernameController.text.isEmpty && _character == null && !isChecked ) {
                        Navigator.pop(context);
                      } else {
                      _usernameController.clear();
                      setState(() {
                        _character = null;
                        isChecked = false;
                      });
                      }
                    },
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: const Text('CANCEL'),
                  ),
                  
                  ElevatedButton(
                    onPressed: () {
                        _shocwSnackBar();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Beranda())
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade400,
                      foregroundColor: Colors.white,
                      elevation: 8.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: const Text('SUBMIT'),
                  )
                  
                ]
              ),
                  ],
                )
              ),
              
              const SizedBox(height: 20,)

            ],
          ),
      ),
        bottomNavigationBar: SafeArea(
          child: Text('Copyright @2025', textAlign: TextAlign.center),
        ),
      );
  }
}