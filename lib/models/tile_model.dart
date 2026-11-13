enum TileType {
  //kare türlerini tanımladım. enum ile seçenekleri sabitlemiş oldum.
  normal,
  moveBonus,
  movePenalty,
  bridge,
  checkpoint,
}

class Tile {
  final int index;
  final TileType type;
  final int value;
  final int?
  targetTileIndex; // Sadece köprü karelerinde "kaçıncı kareye ışınlayacak?" bilgisini tutar.

  // kurduğumuz bu kalıptan gerçek kareler üretecek kurucu metoda iht var. sınıf adı ile aynı olan bu blok kare olştururken hangi bilgilerin verilmesi ferektiiğni belirler.
  const Tile({
    required this.index, //required ile sıra numarasını(index) vermeyi zorunlu kıldık.
    this.type = TileType.normal, //türü belirtilmediyse otomatik normal kabul et
    this.value = 0, //değer belirtilmediyse otomatik 0 kabul eder.
    this.targetTileIndex,
  });
}
