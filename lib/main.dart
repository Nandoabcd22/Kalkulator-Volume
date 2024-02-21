import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Volume BALOK, KUBUS, TABUNG',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: VolumeCalculator(),
    );
  }
}

class VolumeCalculator extends StatefulWidget {
  @override
  _VolumeCalculatorState createState() => _VolumeCalculatorState();
}

class _VolumeCalculatorState extends State<VolumeCalculator> {
  // Variabel yang menyimpan nilai panjang, lebar, tinggi, sisi, dan radius
  double panjang = 0;
  double lebar = 0;
  double tinggi = 0;
  double sisi = 0;
  double radius = 0;
  // Variabel yang menyimpan nilai volume
  double volumeBalok = 0;
  double volumeKubus = 0;
  double volumeTabung = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Volume'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Kolom untuk input balok
            _buildInputField('Balok', [
              _buildInputFormField('Panjang', 'Masukkan panjang (cm)', (value) {
                panjang = double.parse(value);
              }),
              _buildInputFormField('Lebar', 'Masukkan lebar (cm)', (value) {
                lebar = double.parse(value);
              }),
              _buildInputFormField('Tinggi', 'Masukkan tinggi (cm)', (value) {
                tinggi = double.parse(value);
              }),
            ]),
            SizedBox(height: 16),
            // Kolom untuk input kubus
            _buildInputField('Kubus', [
              _buildInputFormField('Sisi', 'Masukkan sisi (cm)', (value) {
                sisi = double.parse(value);
              }),
            ]),
            SizedBox(height: 16),
            // Kolom untuk input tabung
            _buildInputField('Tabung', [
              _buildInputFormField('Radius', 'Masukkan radius (cm)', (value) {
                radius = double.parse(value);
              }),
              _buildInputFormField('Tinggi', 'Masukkan tinggi (cm)', (value) {
                tinggi = double.parse(value);
              }),
            ]),
            SizedBox(height: 16),
            // Tombol untuk menghitung volume
            ElevatedButton(
              onPressed: _calculateVolume,
              child: Text('Hitung'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membangun kolom input
  Widget _buildInputField(String label, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ...children,
      ],
    );
  }

  // Widget untuk membangun input form field
  Widget _buildInputFormField(String label, String hint, Function(String) onChanged) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, hintText: hint),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }

  // Fungsi untuk menghitung volume
  void _calculateVolume() {
    // Hitung volume balok
    volumeBalok = panjang * lebar * tinggi;
    // Hitung volume kubus
    volumeKubus = sisi * sisi * sisi;
    // Hitung volume tabung
    volumeTabung = 3.14 * radius * radius * tinggi;

    // Tampilkan dialog dengan hasil perhitungan
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil Perhitungan'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Volume Balok: $volumeBalok cm³'),
              Text('Volume Kubus: $volumeKubus cm³'),
              Text('Volume Tabung: $volumeTabung cm³'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
