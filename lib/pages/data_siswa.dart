/*
Kriteria :
- Halaman utama menampilkan list nama siswa (gunakan data dummy awal: misal “Budi”, “Siti”).
- Ada tombol “Tambah Siswa” yang membuka form input.
- Form input memiliki validasi: Nama tidak boleh kosong dan Minimal 3 karakter
- Setelah validasi sukses, nama siswa baru ditambahkan ke list dummy dan langsung tampil di halaman utama.
*/
import 'package:flutter/material.dart';
import 'package:sandbox_app/dummy/siswa.dart';
import 'package:sandbox_app/pages/input_siswa.dart';

class DataSiswa extends StatefulWidget {
  const DataSiswa({super.key});

  @override
  State<DataSiswa> createState() => _DataSiswaState();
}

class _DataSiswaState extends State<DataSiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Siswa'), centerTitle: true,),
      body: ListView.separated(
        padding: EdgeInsets.all(24),
        itemBuilder: (context, index) {
          final item = siswa;
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