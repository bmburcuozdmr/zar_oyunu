# Veri Modelleri ve Dart Temel Yapıları Analizi

**Proje Adı:** Zar Yolu – Stratejik Kutu Oyunu  
**Tarih:** 12 Kasım 2026  
**Aşama:** Faz 1 (Sprint 1) – Çekirdek Mantık ve Veri Modelleri  

---

## 1. Öğrenilen Dart Kavramları

### 1.1. `enum` (Enumeration / Numaralandırma)
Sabit seçeneklerden oluşan veri gruplarını (örneğin parkur üzerindeki kare türleri veya oyun sırası durumları) tanımlamak için kullanılır.
- **Sağladığı Avantajlar:**
  - `String` kullanımından kaynaklanabilecek yazım hatalarını (typo) önler.
  - Derleme zamanında tip güvenliği (type safety) sağlar; tanımlı olmayan bir değer atanamaz.
  - IDE üzerinde otomatik tamamlama (IntelliSense) ve `switch-case` yapılarında tüm olasılıkların eksiksiz kontrol edilmesini kolaylaştırır.

### 1.2. `class` ve `final` (Immutability / Değişmezlik)
- **`class`:** Oyun içindeki varlıkların (Kare, Oyuncu) özelliklerini ve davranışlarını tanımlayan nesne kalıbıdır.
- **`final`:** Bir değişkene yalnızca tek bir kez değer atanabilmesini sağlar. Değer atandıktan sonra değiştirilmesine izin vermez.
- **Mimari Önemi:**
  - Sabit kalması gereken verilerin (örneğin bir karenin parkurdaki sırası veya türü) oyun esnasında yanlışlıkla değiştirilmesini engeller.
  - Kodun okunabilirliğini ve öngörülebilirliğini artırır.
  - Flutter arayüz (UI) yenileme mekanizmalarında değişmeyen nesnelerin tekrar hesaplanmasını önleyerek performansa katkı sağlar.

---

## 2. Oyun Veri Modelleri Tasarımı

### 2.1. `Tile` (Kare) Modeli — Tamamen Değişmez (Immutable)
Parkur haritası yüklendikten sonra karelerin özellikleri oyun boyunca değişmeyeceği için `Tile` sınıfındaki tüm alanlar (`index`, `type`, `value`, `targetTileIndex`) **`final`** olarak tasarlanacaktır.

### 2.2. `Player` (Oyuncu) Modeli — Hibrit Yapı
- **Sabit Alanlar (`final`):** Oyuncunun kimliği (`id`), adı (`name`), piyon rengi (`color`) ve yapay zekâ olup olmadığı (`isAI`) oyun boyunca sabit kalır.
- **Dinamik Alanlar:** Oyuncunun parkurdaki güncel konumu (`currentPosition`) ve topladığı puan (`score`) her zar atışında güncelleneceği için değiştirilebilir (mutable) bırakılacaktır.

---------
Şimdi enum anladığım kadarıyla değişken tanımlamada string'den daha fazla avantaj sağlayan bir yapı. Nasıl avantaj sağlar? Mesela yazım hatalarının önüne geçebilir ya da belirli başlı tanımlamalara izin verir ve bu da bize yazım, kod yazımında kolaylık sağlar. Mesela bir değişken tanımladığımızda onunla ilgili bir sorgulama, if sorgusu yapacaksak mesela orada önerilenlerde çıkar tanımladıklarımız ve böylece daha kolay erişebiliriz
-----
Class bir değişkenin hangi sınıfa ait olduğunu belirtmemizi sağlar. Final ise değişkene bir kere değer atayabilmemizi sağlar. Daha sonrasında atadığımız değerden başka bir değer atadığımızda buna engel olur. Peki bu bize ne sağlar? Kodun okunabilirliğini artırır ve karmaşıklığa yol açmasını engeller. Bir de Flutter için de çok uygun bir yapıdır.