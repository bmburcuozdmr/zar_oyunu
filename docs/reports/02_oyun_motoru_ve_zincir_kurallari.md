# Oyun Motoru (`GameEngine`) ve Zincirleme Kurallar

**Tarih:** 22 Kasım 2026  
**Durum:** Tamamlandı ve Birim Testleri (`game_engine_test.dart`) ile Doğrulandı.

## 1. Genel Bakış
`GameEngine` (`lib/services/game_engine.dart`), oyunun arayüzden (UI) tamamen bağımsız çalışan matematiksel beynidir. 50 karelik tahtayı üretir, zar atar ve oyuncu hareketlerini yönetir.

## 2. Temel Kurallar ve Güvenlik Önlemleri
* **Tahta Sınırı (`.clamp(0, 49)`):** Oyuncunun konumu hiçbir zaman 0'ın altına düşemez ve 49'u (bitiş çizgisini) aşamaz.
* **Son 5 Kare Kuralı:** Bitiş çizgisine yaklaşıldığında (44-48. kareler arası) oyuncuyu doğrudan bitişe fırlatacak `moveBonus` kareleri yerleştirilmez.
* **Zincirleme Etki & Sonsuz Döngü Koruması (`chainCount < 5`):** Bir oyuncu özel bir kareye (örneğin `+3` bonus) bastığında yeni gittiği karede de bir etki varsa (örneğin `Kontrol Noktası`) zincirleme olarak o etki de çalışır. Olası bir sonsuz döngüyü (oyunun donmasını) engellemek için zincirleme etki en fazla **5 adım** ile sınırlandırılmıştır.