install.packages("readxl") # Eğer yüklü değilse bu paketi kullanırız
library(readxl)
#K-Means Kümeleme algoritması, denetimsiz öğrenme yöntemlerinden biridir ve genellikle kümeleme problemleri için kullanılır. 
#Yani ne regresyon ne de sınıflandırma için doğrudan uygundur. K-Means, verilere önceden tanımlanmış bir etiket (kategori) olmadan, veri noktalarını gruplara ayırmak için kullanılır. 
#Dolayısıyla, sınıflandırma veya regresyondan ziyade kümeleme amacı taşır.
install.packages("cluster")
install.packages("factoextra")
library(tidyverse)  # Veri işleme ve görselleştirme
library(caret)      # Veri bölme ve model değerlendirme
library(cluster)    # Silhouette skoru hesaplamak için
library(factoextra) # K-means analizini görselleştirmek için

# Dosya yolunu belirtme
veri_seti <- read_xlsx("C:/Users/sevay/Downloads/verilerim (3) (3) 30.xlsx")


# Veriyi görüntüleme
View(veri_seti)

# Veri setinin ilk 6 satırını görüntüleyelim
head(veri_seti)




# 1. Veri Ön İşleme
# Eksik verileri kontrol etme
any(is.na(veri_seti))
sum(is.na(veri_seti))


veri_seti_clean <- veri_seti[complete.cases(veri_seti), ]
sum(is.na(veri_seti_clean))  # 0 olmalı





str(veri_seti_clean)



# Adım 3: Aykırı değer analizi
boxplot(veri_seti_clean$yolsuzlugun_kontrolu, main = "Sepal Length Boxplot", col = "gray")  

# Aykırı değerlerin tespiti için IQR yöntemi
Q1 <- quantile(veri_seti_clean$yolsuzlugun_kontrolu, 0.25)
Q3 <- quantile(veri_seti_clean$yolsuzlugun_kontrolu, 0.75)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR
#Verileriniz normal dağılıma yakınsa:Z-Score daha uygundur.
#Verileriniz çarpık bir dağılıma sahipse veya uç değerler dağılımı bozuyorsa: IQR daha iyi bir seçimdir.

# Aykırı değerlerin sayısını kontrol ediyoruz
sum(veri_seti_clean$yolsuzlugun_kontrolu < lower_bound | veri_seti_clean$yolsuzlugun_kontrolu > upper_bound)

# Aykırı değerleri ortalama ile değiştirme (#Eğer aykırı değer olsaydı?)
veri_seti_clean <- veri_seti_clean %>%
  mutate(yolsuzlugun_kontrolu = ifelse(yolsuzlugun_kontrolu < lower_bound |yolsuzlugun_kontrolu> upper_bound,
                                       mean(yolsuzlugun_kontrolu, na.rm = TRUE),
                                       yolsuzlugun_kontrolu))

shapiro.test(veri_seti_clean$yolsuzlugun_kontrolu)











# Adım 3: Aykırı değer analizi
boxplot(veri_seti_clean$kisi_basina_cari_saglik_harcamasi, main = "Sepal Length Boxplot", col = "gray")  

# Aykırı değerlerin tespiti için IQR yöntemi
Q1 <- quantile(veri_seti_clean$kisi_basina_cari_saglik_harcamasi, 0.25)
Q3 <- quantile(veri_seti_clean$kisi_basina_cari_saglik_harcamasi, 0.75)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR
#Verileriniz normal dağılıma yakınsa:Z-Score daha uygundur.
#Verileriniz çarpık bir dağılıma sahipse veya uç değerler dağılımı bozuyorsa: IQR daha iyi bir seçimdir.

# Aykırı değerlerin sayısını kontrol ediyoruz
sum(veri_seti_clean$kisi_basina_cari_saglik_harcamasi < lower_bound | veri_seti_clean$kisi_basina_cari_saglik_harcamasi > upper_bound)
# Aykırı değerleri ortalama ile değiştirme (#Eğer aykırı değer olsaydı?)
veri_seti_clean <- veri_seti_clean %>%
  mutate(kisi_basina_cari_saglik_harcamasi = ifelse(kisi_basina_cari_saglik_harcamasi < lower_bound |kisi_basina_cari_saglik_harcamasi > upper_bound,
                                                    mean(kisi_basina_cari_saglik_harcamasi, na.rm = TRUE),
                                                    kisi_basina_cari_saglik_harcamasi))

shapiro.test(veri_seti_clean$kisi_basina_cari_saglik_harcamasi)











# Adım 3: Aykırı değer analizi
boxplot(veri_seti_clean$bebek_olum_sayisi, main = "Sepal Length Boxplot", col = "gray")  

# Aykırı değerlerin tespiti için IQR yöntemi
Q1 <- quantile(veri_seti_clean$bebek_olum_sayisi, 0.25)
Q3 <- quantile(veri_seti_clean$bebek_olum_sayisi, 0.75)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR
#Verileriniz normal dağılıma yakınsa:Z-Score daha uygundur.
#Verileriniz çarpık bir dağılıma sahipse veya uç değerler dağılımı bozuyorsa: IQR daha iyi bir seçimdir.

# Aykırı değerlerin sayısını kontrol ediyoruz
sum(veri_seti_clean$bebek_olum_sayisi < lower_bound | veri_seti_clean$bebek_olum_sayisi > upper_bound)
# Aykırı değerleri ortalama ile değiştirme (#Eğer aykırı değer olsaydı?)
veri_seti_clean <- veri_seti_clean %>%
  mutate(bebek_olum_sayisi = ifelse(bebek_olum_sayisi < lower_bound |bebek_olum_sayisi > upper_bound,
                                    mean(bebek_olum_sayisi, na.rm = TRUE),
                                    bebek_olum_sayisi))

shapiro.test(veri_seti_clean$bebek_olum_sayisi)








# Adım 3: Aykırı değer analizi
boxplot(veri_seti_clean$isgucu_toplam, main = "Sepal Length Boxplot", col = "gray")  

# Aykırı değerlerin tespiti için IQR yöntemi
Q1 <- quantile(veri_seti_clean$isgucu_toplam, 0.25)
Q3 <- quantile(veri_seti_clean$isgucu_toplam, 0.75)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR
#Verileriniz normal dağılıma yakınsa:Z-Score daha uygundur.
#Verileriniz çarpık bir dağılıma sahipse veya uç değerler dağılımı bozuyorsa: IQR daha iyi bir seçimdir.

# Aykırı değerlerin sayısını kontrol ediyoruz
sum(veri_seti_clean$isgucu_toplam < lower_bound | veri_seti_clean$isgucu_toplam > upper_bound)
# Aykırı değerleri ortalama ile değiştirme (#Eğer aykırı değer olsaydı?)
veri_seti_clean <- veri_seti_clean %>%
  mutate(isgucu_toplam = ifelse(isgucu_toplam < lower_bound |isgucu_toplam > upper_bound,
                                mean(isgucu_toplam, na.rm = TRUE),
                                isgucu_toplam))

shapiro.test(veri_seti_clean$isgucu_toplam)









# Adım 3: Aykırı değer analizi
boxplot(veri_seti_clean$egitim_harcamalari_dolar, main = "Sepal Length Boxplot", col = "gray")  

# Aykırı değerlerin tespiti için IQR yöntemi
Q1 <- quantile(veri_seti_clean$egitim_harcamalari_dolar, 0.25)
Q3 <- quantile(veri_seti_clean$egitim_harcamalari_dolar, 0.75)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR
#Verileriniz normal dağılıma yakınsa:Z-Score daha uygundur.
#Verileriniz çarpık bir dağılıma sahipse veya uç değerler dağılımı bozuyorsa: IQR daha iyi bir seçimdir.

# Aykırı değerlerin sayısını kontrol ediyoruz
sum(veri_seti_clean$egitim_harcamalari_dolar < lower_bound | veri_seti_clean$egitim_harcamalari_dolar > upper_bound)
# Aykırı değerleri ortalama ile değiştirme (#Eğer aykırı değer olsaydı?)
veri_seti_clean <- veri_seti_clean %>%
  mutate(egitim_harcamalari_dolar = ifelse(egitim_harcamalari_dolar < lower_bound |egitim_harcamalari_dolar > upper_bound,
                                           mean(egitim_harcamalari_dolar, na.rm = TRUE),
                                           egitim_harcamalari_dolar))

shapiro.test(veri_seti_clean$egitim_harcamalari_dolar)




















# Özellikleri ölçeklendirelim
scaled_data <- veri_seti_clean
scaled_data[, 3:7] <- scale(veri_seti_clean[, 3:7])  # İlk 5 sütun (numerik özellikler) ölçeklendirildi

# Kontrol etmek için ilk birkaç satırı gösterelim
head(scaled_data)

# 3 kümeye ayırmak için k-means uyguluyoruz
set.seed(123)  # Sonuçların tekrarlanabilirliği için rastgelelik sabitleniyor
kmeans_result <- kmeans(scaled_data[, 3:7], centers = 4, nstart = 25)

# Sonucu yazdır
kmeans_result



# Adım 7: Kümeleme Sonuçlarını Görselleştirme 
fviz_cluster(kmeans_result, data = scaled_data[, 3:7], #fviz_cluster:factoextra paketinden gelen bir fonksiyondur. Bu fonksiyon, k-means veya diğer kümeleme algoritmalarının sonuçlarını görselleştirmek için kullanılır.
             geom = "point", ellipse.type = "euclid", #ellipse.type = "euclid": Her bir küme etrafında Euclidean mesafesine dayalı bir elips çizer. 
             main = "K-means Kumeleme Sonuclari")





# Gerekli kütüphaneler
library(cluster)
library(factoextra)

# 1. Veriyi seç (3:7 sütunları)
data_subset <- scaled_data[, 3:7]

# 2. K-means uygulaması (örnek: 3 küme)
kmeans_result <- kmeans(data_subset, centers = 4, nstart = 25)

# 3. Silhouette skorlarını hesapla
sil_score <- silhouette(kmeans_result$cluster, dist(data_subset))

# 4. Silhouette grafiğini çiz
fviz_silhouette(sil_score, palette = "Set2")  # Alternatif: "jco", "npg", "Dark2"




# Adım 6: Elbow Yöntemi ile K Değerini Belirleme
wss <- numeric(10)  # 1'den 10'a kadar WSS değerlerini depolayalım
for (k in 1:10) {
  kmeans_temp <- kmeans(scaled_data[, 3:7], centers = k, nstart = 25)
  wss[k] <- kmeans_temp$tot.withinss #Her iterasyon sonucunda elde edilen toplam küme içi kareler toplamı (tot.withinss) değeri, wss vektörüne kaydedilir.
}
wss
#Gözlemler küme içinde daha iyi gruplanmaya başladıkça, WSS değeri küçülür. 
#Yani, küme sayısı arttıkça her kümenin içindeki veri noktaları birbirine daha yakın hale gelir.
#Sonuç Yorumu:
#k = 1 ile k = 2 arasında büyük bir düşüş var: 596 → 220.72. Bu, veri setinde doğal bir küme yapısı olduğunu gösterebilir.
#k = 3 sonrasında düşüş yavaşlıyor, bu da 3 kümeli bir yapı olasılığını güçlendiriyor.
#Daha yüksek k değerlerinde WSS hâlâ azalmaya devam etse de, bu azalmalar marjinal hale geliyor (örneğin, k = 9 ve k = 10 arasında sadece küçük bir fark var: 56.05 → 48.26).

# WSS grafikle gösterelim
plot(1:10, wss, type = "b", pch = 19, col = "red", 
     xlab = "K Değeri", ylab = "WSS (Within Sum of Squares)", 
     main = "Elbow Yöntemi")




scaled_data$kume <- kmeans_result$cluster







# Gerekli kütüphane
library(corrplot)

# Korelasyon matrisi hesapla (örnek olarak scaled_data'daki sayısal sütunlar)
cor_matrix <- cor(scaled_data[, c(3:7)])

# Görselleştir (sayıları da yazdır)
corrplot(
  cor_matrix,
  method = "color",
  type = "upper",
  tl.col = "black",
  tl.cex = 0.8,
  addCoef.col = "black"  # Korelasyon katsayılarını karelerin üstüne yazdır
)



# Gerekli kütüphane
install.packages("car")  # Sadece bir kez kurulur
library(car)




# Bir regresyon modeli kurman gerekiyor — bu sadece VIF için formalite
model <- lm(veri_seti_clean$bebek_olum_sayisi ~ ., data = scaled_data[, c(3:7)])  # X yerine bağımlı değişkenini yaz

# VIF hesapla
vif(model)


