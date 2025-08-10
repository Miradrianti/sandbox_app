/*
Kriteria :
- Halaman utama menampilkan list nama siswa (gunakan data dummy awal: misal “Budi”, “Siti”).
- Ada tombol “Tambah Siswa” yang membuka form input.
- Form input memiliki validasi: Nama tidak boleh kosong dan Minimal 3 karakter
- Setelah validasi sukses, nama siswa baru ditambahkan ke list dummy dan langsung tampil di halaman utama.
*/

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sandbox_app/dummy/siswa.dart';
import 'package:sandbox_app/pages/input_siswa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataSiswa extends StatefulWidget {
  const DataSiswa({super.key});

  @override
  State<DataSiswa> createState() => _DataSiswaState();
}

class _DataSiswaState extends State<DataSiswa> {
  List<String> siswa = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    // final data = await rootBundle.loadString('assets/siswa.json');

    // final newData = jsonDecode(data);
    
    // setState(() {
    //   siswa = List.from(newData);
    // });
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getStringList('siswa');

    //prefs.remove('siswa');
    if (data != null) {
      setState(() {
        siswa = data;
      });
    }
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('siswa', [jsonEncode(siswa)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Siswa'), centerTitle: true,),
      body: ListView.separated(
        padding: EdgeInsets.all(24),
        itemBuilder: (context, index) {
          final item = siswa[index];
          return Text('${index + 1}. $item');
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12,);
        },
        itemCount: siswa.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => const InputSiswa())); //masih error
        },
        child: Icon(Icons.add),
      ),
    );
  }
}