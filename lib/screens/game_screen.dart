import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key}); // sınıfımızın kurucu metodudur.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ekranının ana iskeleti
      //1.en üstteki başlık çubuğu
      appBar: AppBar(
        title: const Text('zar yolu'),
        centerTitle: true, //başlığı ortalar
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      //2.gövde: yukardan aşağı column ile içerikleri yerleştirdik
      body: Column(
        children: [
          // ÜST BÖLÜM: Skor ve Sıra Bilgisi Alanı (Şimdilik yer tutucu kutu)
          Container(
            width: double.infinity, // Ekranın tüm genişliğini kapla
            padding: const EdgeInsets.all(16),
            color: Colors.indigo.shade50,
            child: const Text(
              'Skor Tablosu(oyuncu 1 vs oyuncu 2)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          // ORTA BÖLÜM: Oyun Tahtası Alanı
          // Expanded: "Üst ve alt kutulardan geriye kalan tüm boşluğu sen kapla" demektir.
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              child: const Center(
                child: Text(
                  '50 karelik oyun tahtası burada olacak',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ),
          ),

          // ALT BÖLÜM: Zar ve Buton Alanı
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.indigo.shade50,
            child: const Center(
              child: Text(
                'zar atma butonu buraya gelcek',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
