import 'package:flutter/material.dart';

class DataSiswa extends StatelessWidget {
  const DataSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Siswa'), centerTitle: true,),
      body: ListView.builder(
        padding: EdgeInsets.all(24),
        itemBuilder: (context, index) {
          return Text('Fulan');
        },
        itemCount: 10,
      ),
    );
  }
}