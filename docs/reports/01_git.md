## 🚀 Git ve Geliştirme İş Akışı

Projeyi geliştirirken kod değişikliklerini yerel depoya kaydetmek ve GitHub'a aktarmak için standart 3 adımlı iş akışı uygulanır:

1. **Hazırlık Alanı (Staging):** Yapılan değişiklikleri kargo paketine ekler:
   ```bash
   git add .
Yerel Kayıt (Commit): Paketi açıklayıcı bir mesajla mühürler:

Bash
git commit -m "docs: açıklama buraya yazılır"
Buluta Gönderme (Push): Mühürlenen sürümü GitHub sunucusuna aktarır:

Bash
git push
Not: git init (yerel depo başlatma) ve git remote add origin <link> (GitHub bağlantısı) adımları kurulum aşamasında bir kez yapılmıştır; sonraki geliştirmelerde yalnızca yukarıdaki 3 komutluk döngü kullanılır.


Bu metni `README.md` dosyanın en altına yapıştırıp kaydedebilir, ardından bu yeni değişikliği