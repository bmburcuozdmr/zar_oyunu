import 'dart:math';
import '../models/tile_model.dart';
import '../models/player_model.dart';

class GameEngine {
  static const int totalTiles = 50;
  //makine1: 50 karelik oyun tahtası oluşturur.
  List<Tile> generateTiles() {
    //0dan 49 a kadar her sıra(index için bir kare üret.Return ile bu listeyi fonk dışına teslim eder.
    return List.generate(totalTiles, (index) {
      if (index == 0 || index == totalTiles - 1) {
        return Tile(index: index, type: TileType.normal);
      }
      if (index == 6) {
        //eğer index 6 ise türü köprü olan, hedefi 18. kare olan bir taş üret.
        return Tile(index: index, type: TileType.bridge, targetTileIndex: 18);
      }
      if (index == 22) {
        return Tile(index: index, type: TileType.bridge, targetTileIndex: 35);
      }
      if (index % 10 == 0) {
        //her 10 kare de 50 puan kazandırır.
        return Tile(index: index, type: TileType.checkpoint, value: 50);
      }
      if (index < totalTiles - 6 && index % 7 == 0) {
        return Tile(index: index, type: TileType.moveBonus, value: 3);
      }
      if (index % 8 == 0) {
        return Tile(index: index, type: TileType.movePenalty, value: -2);
      }
      return Tile(index: index, type: TileType.normal);
    });
  }

  //makine2: zar atma fonk.
  int rollDice() {
    return Random().nextInt(6) + 1; //zarda 0 olmadığı için +1 ekledik
  }

  //makine3: hareket fonk.
  //oyuncunun mevcut konumunu güncelleyecek fonk
  void movePlayer(Player player, int diceValue, List<Tile> board) {
    int newPosition =
        player.currentPosition +
        diceValue; // oyuncunun mevcut karesine zar değerini ekler.
    if (newPosition >= totalTiles - 1) {
      //bitti mi kontrolü
      player.currentPosition = totalTiles - 1;
      return; //oyun bitmiş olacağı için alt satırlara bakmadan çık.
    }
    int chainCount =
        0; //Oyunun sonsuz döngüye girip donmasını engeller (En fazla 5 zincir).
    bool hasEffect =
        true; //Bastığım karede hâlâ uygulanacak bir özellik var mı?" (Evet = true).

    while (hasEffect && chainCount < 5) {
      Tile currentTile =
          board[newPosition]; // Tahta listesinden ('board'), oyuncunun o an bastığı sıradaki ('newPosition') kareyi çekip incelemeye alıyoruz.

      //elimizdeki karenin türüne göre işlem uygulanacak.
      switch (currentTile.type) {
        case TileType.moveBonus:
        case TileType.movePenalty:
          newPosition +=
              currentTile.value; //bonus veya penalty değerini yeni konuma ekle.
          newPosition = newPosition.clamp(
            0,
            totalTiles - 1,
          ); //yeni konumu 0 ile 49 arasında sınırla.
          chainCount++; //zincir sayısını 1 artır.hasseffect true olduğundan yeni karenin etkisine bakılır.
          break;
        case TileType.bridge:
          // köprünün gideceği hedef kare tannımlı mı kontrol eder
          if (currentTile.targetTileIndex != null) {
            newPosition = currentTile.targetTileIndex!;
            chainCount++; //gelinen karede etki var mı
          } else {
            hasEffect = false; //hedef kare yoksa etkiyi bitir.
          }
          break;
        case TileType.checkpoint:
          player.score += currentTile.value; //puanı ekle
          hasEffect = false; //etkiyi bitir.
          break;
        case TileType.normal:
          hasEffect = false;
          break;
      }
      if (newPosition >= totalTiles - 1) {
        newPosition = totalTiles - 1;
        hasEffect = false; //oyuncu bitiş karesine ulaştıysa
      }
    }
    // tüm zincir bittikten sonra oyuncunun son konumunu kaydeder.
    player.currentPosition = newPosition;
  }
}
