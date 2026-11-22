//hazır test  kütüphanesini dahil ettik
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
// test edilecek dosyalarımız
import 'package:zar_oyunu/models/tile_model.dart';
import 'package:zar_oyunu/models/player_model.dart';
import 'package:zar_oyunu/services/game_engine.dart';

void main() {
  // testleri grup altında topluyoruz.
  group('GameEngine Kural Testleri:', () {
    //test odası
    test('tahta 50 kare olmalı ve son 5 karede + değer olmamalı', () {
      final engine = GameEngine();
      final board = engine.generateTiles();
      //kontrol 1: tahta 50 kare olmalı
      expect(board.length, 50);
      //kontrol 2: son 5 karede + değer olmamalı
      for (int i = 44; i <= 48; i++) {
        expect(board[i].type != TileType.moveBonus, true);
      }
    });

    test('oyuncu +3 bonusa basıp 10.kareye geçmeli ve +10 puan almalı ', () {
      final engine = GameEngine();
      final board = engine.generateTiles();
      final player = Player(
        id: 'p1',
        name: 'test oyuncusu',
        color: Colors.blue,
        currentPosition: 4,
      ); // başlangıç konumu 4. kare

      engine.movePlayer(
        player,
        3,
        board,
      ); //4.karedeki oyuncuya 3 zar attırıyoruz
      expect(player.currentPosition, 10);
      expect(player.score, 50);
    });
    test('bitiş çizgisi geçildiğinde oyuncu 49.kareye sabitlenmeli', () {
      final engine = GameEngine();
      final board = engine.generateTiles();
      final player = Player(
        id: 'p1',
        name: 'test oyuncusu',
        color: Colors.red,
        currentPosition: 47,
      );
      //oyuncuya 6 zar attırıyoruz.(47+6=53)
      engine.movePlayer(player, 6, board);
      expect(player.currentPosition, 49);
    });
  }); //group sonu
} //main sonu
