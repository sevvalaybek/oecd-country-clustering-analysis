# OECD Ülkelerinin Sosyo-Ekonomik Göstergeler ile K-Means Kümeleme Analizi


<img width="824" height="429" alt="image" src="https://github.com/user-attachments/assets/5d4cb2ac-4532-49e4-8c4a-58f74527c2c2" />

## Proje Hakkında

Bu proje, OECD ülkelerinin çeşitli sosyo-ekonomik göstergeler kullanılarak K-Means kümeleme algoritması ile analiz edilmesini amaçlamaktadır.

Çalışmada ülkeler;

* Yolsuzluğun Kontrolü
* Kişi Başına Cari Sağlık Harcaması
* Bebek Ölüm Sayısı
* İş Gücüne Katılım
* Eğitim Harcamaları

gibi göstergeler üzerinden değerlendirilmiştir.

Veri ön işleme, aykırı değer analizi, normal dağılım testleri, ölçeklendirme, kümeleme analizi ve görselleştirme işlemleri R programlama dili kullanılarak gerçekleştirilmiştir.

---

## Veri Seti

Çalışmada OECD ülkelerine ait sosyo-ekonomik göstergeler kullanılmıştır.

Analizde kullanılan temel değişkenler:

* Ülke
* Yolsuzluğun Kontrolü
* Kişi Başına Cari Sağlık Harcaması
* Bebek Ölüm Sayısı
* İş Gücüne Katılım Oranı
* Eğitim Harcamaları

---

## Veri Ön İşleme

Analiz öncesinde aşağıdaki işlemler uygulanmıştır:

* Eksik veri kontrolü
* Aykırı değer analizi (IQR yöntemi)
* Shapiro-Wilk normallik testleri
* Veri standardizasyonu ve ölçeklendirme

---

## K-Means Kümeleme Analizi

Ülkelerin benzer özelliklerine göre gruplandırılması amacıyla K-Means algoritması uygulanmıştır.

Optimum küme sayısının belirlenmesi için:

* Elbow Method
* Silhouette Analysis

yöntemlerinden yararlanılmıştır.


<img width="853" height="480" alt="image" src="https://github.com/user-attachments/assets/e9c56175-8bc0-48a8-ba8c-a2f1b6ecedc3" />

---

## Ek Analizler

Çalışma kapsamında ayrıca:

* Korelasyon Analizi
* Korelasyon Matrisi Görselleştirmesi
* VIF (Variance Inflation Factor) Analizi

gerçekleştirilmiştir.

---

## Görselleştirmeler

Projede aşağıdaki görselleştirmeler oluşturulmuştur:

* K-Means Kümeleme Grafiği
* Silhouette Grafiği
* Elbow Method Grafiği
* Korelasyon Matrisi

---

## Kullanılan Teknolojiler

* R
* readxl
* tidyverse
* cluster
* factoextra
* corrplot
* caret

---

## Sonuç

Bu çalışma kapsamında OECD ülkelerine ait sosyo-ekonomik göstergeler kullanılarak veri ön işleme, istatistiksel analiz ve makine öğrenmesi teknikleri uygulanmıştır.

Analiz sürecinde eksik veriler kontrol edilmiş, aykırı değer analizleri gerçekleştirilmiş ve değişkenlerin dağılım özellikleri incelenmiştir. Veri setinin analiz için uygun hale getirilmesinin ardından değişkenler standartlaştırılarak K-Means kümeleme algoritması uygulanmıştır.

Optimum küme sayısının belirlenmesi amacıyla Elbow Yöntemi ve Silhouette Analizi kullanılmıştır. Elde edilen sonuçlar doğrultusunda OECD ülkeleri benzer sosyo-ekonomik özelliklerine göre dört farklı kümeye ayrılmıştır. Böylece ülkeler arasındaki benzerlikler ve farklılıklar veri temelli olarak ortaya konulmuştur.

Korelasyon analizi sonuçları değişkenler arasındaki ilişkilerin incelenmesine olanak sağlamış, VIF analizi ise çoklu doğrusal bağlantı probleminin değerlendirilmesinde kullanılmıştır. Bu analizler veri setindeki değişkenlerin birbirleriyle olan etkileşimlerinin daha iyi anlaşılmasını sağlamıştır.

Çalışma sonucunda sağlık harcamaları, eğitim harcamaları, iş gücü göstergeleri ve yönetişim göstergeleri bakımından OECD ülkeleri arasında belirgin farklılıklar bulunduğu gözlemlenmiştir. Kümeleme sonuçları, benzer gelişmişlik düzeyine sahip ülkelerin aynı gruplarda toplandığını ve ülkelerin sosyo-ekonomik yapılarının veri madenciliği yöntemleri ile başarılı şekilde sınıflandırılabildiğini göstermiştir.

Bu proje, veri temizleme aşamasından istatistiksel analizlere ve makine öğrenmesi uygulamalarına kadar uçtan uca bir veri analizi çalışması olarak geliştirilmiş olup, ülkelerin kalkınma göstergelerinin karşılaştırmalı olarak incelenmesine katkı sağlamaktadır.
