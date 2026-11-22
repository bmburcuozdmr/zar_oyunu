//flutter ın color özelliklerini dahil ettik
import 'package:flutter/material.dart';

class Player {
  final String id; // oyuncunun benzersiz kimliği
  final String name; // oyuncunun adı
  final Color color; // oyuncunun rengi
  final bool isAI; //oyuncu fiziksel biri mi?

  int currentPosition; //oyuncunun o anki bulunduğu kare
  int score;

  //oyunc kurucu metodunda ise isim ve renk girmeyi zorunlu tutup, başlangıç konumunu ve puanını 0 olarak ayarladık.
  Player({
    required this.id, //kimlik zorunlu
    required this.name, //isim zorunlu
    required this.color, //renk zorunlu
    this.isAI = false, //varsayılan olarak fiziksel oyuncu kabul et
    this.currentPosition = 0, //baş: 0 dan başlar
    this.score = 0, //her oyuncu 0 puanla başlar.
  });
}
