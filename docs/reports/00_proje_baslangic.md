# Proje Başlangıç ve Hazırlık Raporu

**Proje Adı:** Zar Yolu – Stratejik Kutu Oyunu  
**Tarih:** 11 Kasım 2026  
**Aşama:** Sprint 0 – Temel Altyapı ve Hazırlık  

---

## 1. Projenin Amacı ve Kapsamı
Zar Yolu; geleneksel zar/kutu oyunları mantığını modern mekaniklerle (kestirme köprüler, hareket değiştiren özel kareler, kontrol noktaları ve yapay zekâ) birleştiren iki oyunculu bir strateji ve yarış oyunudur.

## 2. Teknik Altyapı ve Mimari Kararlar
- **Çatı (Framework):** Flutter & Dart
- **Sürüm Kontrolü:** Git & GitHub
- **Dokümantasyon Standardı:** Proje içindeki tüm teknik kararlar, mimari modeller ve ilerleme raporları `docs/` altında Markdown formatında tutulacaktır.
- **Dizin Yapısı:**
  - `docs/reports/`: İlerleme ve sprint raporları
  - `docs/architecture/`: Veri modelleri ve mimari tasarım dokümanları
  - `lib/models/`: Dart veri yapıları
  - `lib/screens/`: Oyun ekranları
  - `lib/widgets/`: Yeniden kullanılabilir arayüz bileşenleri

## 3. Öğrenilen Kavramlar (Sprint 0)
- **.gitignore:** `build/` ve `.dart_tool/` gibi derleme sırasında işletim sistemine özel üretilen geçici dosyaların repoya girmesini engeller. Depolama tasarrufu ve ortam çakışmalarını önler.
- **README.md & Markdown:** Kodun vitrinidir; düz metin formatında zengin biçimlendirme sunarak sürüm kontrolünde satır bazlı takip (diff) kolaylığı sağlar.