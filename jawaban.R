# 1. Probabilitas seorang bayi yang baru lahir berjenis kelamin laki-laki adalah 0,488. Jika kita asumsikan bahwa dalam satu hari di rumah sakit terdapat 10 kelahiran, maka:

# 1.a. Pendistribusian banyak bayi laki-laki
n <- 10     # jumlah kelahiran
p <- 0.488  # probabilitas kelahiran laki-laki
x <- 0:n    # banyak bayi laki-laki
distribusi <- dbinom(x, n, p) 
print(distribusi)
plot(type = "l", distribusi, main = "Distribusi Bayi Laki-laki", 
     xlab = "Banyak Bayi Laki-laki", ylab = "Probabilitas")

# 1.b. probabilitas bahwa tepat tiga bayi di antaranya berjenis kelamin laki-laki
n <- 10    
p <- 0.488  
x <- 3      
probabilitas <- dbinom(x, n, p) 
cat("probabilitas tepat tiga bayi laki-laki adalah", probabilitas)

# 1.c. probabilitas bahwa kurang dari tiga bayi di antaranya berjenis kelamin laki-laki
n <- 10    
p <- 0.488  
x <- 2    
probabilitas <- pbinom(x, n, p) 
cat("probabilitas kurang dari tiga bayi adalah laki-laki adalah", probabilitas)

# 1.d. probabilitas bahwa tiga atau lebih bayi di antaranya berjenis kelamin laki-laki
n <- 10    
p <- 0.488  
x <- 3:n    
probabilitas <- dbinom(x, n, p) 
cat("probabilitas tiga atau lebih bayi adalah laki-laki adalah", sum(probabilitas))

# 1.e. nilai harapan dan simpangan baku banyak bayi laki-laki
n <- 10    
p <- 0.488  
q <- 1 - p  
µ <- n * p       # rata-rata
σ2 <- n * p * q  # varians
σ <- sqrt(σ2)    # simpangan baku
cat("Nilai harapan banyak bayi laki-laki adalah ", µ, "\n")
cat("Simpangan baku banyak bayi laki-laki adalah ", σ)

# 1.f. Histogram pendistribusian banyak bayi laki-laki
n <- 10    
p <- 0.488  
hist(rbinom(1000, n, p), breaks = seq(-1, n + 1, by = 1), 
     xlab = "Banyak Bayi Laki-laki", main = "Histogram Bayi Laki-laki")

#############################################################

# 2. Misalkan banyak kematian karena kanker tulang untuk seluruh pekerja di pabrik ban dalam 20 tahun ke depan adalah 1,8.

# 2.a. Bagaimana pendistribusian banyak kematian karena kanker tulang? Tentukan distribusi dengan parameter yang sesuai.
# distribusi Poisson dengan parameter λ = 1.8
λ <- 1.8  
x <- 0:10
distribusi <- dpois(x, λ) # distribusi Poisson
print(distribusi)
plot(type = "l", distribusi, main = "Distribusi banyak kematian karena kanker tulang", 
     xlab = "Jumlah Kematian", ylab = "Probabilitas")

# 2.b. Ada 4 kematian akibat kanker tulang yang dilaporkan di kalangan pekerja pabrik ban, apakah itu peristiwa yang tidak biasa? Hitung probabilitas berdasarkan distribusi yang telah dipilih 
λ <- 1.8  # rata-rata kematian
x <- 4    # jumlah kematian
probabilitas <- dpois(x, λ)
print(probabilitas)
# karena hasilnya kecil (0.07230173 atau 7.230173%) maka dapat dikatakan bahwa peristiwa tersebut tidak biasa

# 2.c. Berapa peluang paling banyak 4 kematian akibat kanker tulang?
λ <- 1.8  
x <- 4   
probabilitas <- ppois(x, λ)
print(probabilitas)

# 2.d. Berapa peluang lebih dari 4 kematian akibat kanker tulang?
λ <- 1.8  
x <- 4   
probabilitas <- ppois(x, λ)
print(1 - probabilitas)
# hasil = 0.03640666

# 2.e. Berdasarkan distribusi yang telah dipilih, berapakah nilai harapan dan standar deviasi banyak kematian akibat kanker tulang untuk pekerja pabrik ban?
λ <- 1.8  
x <- 4   
µ <- λ         # rata-rata
σ2 <- λ        # varians
σ <- sqrt(σ2)  # standar deviasi
cat("Nilai harapan banyak kematian akibat kanker tulang ", µ, "\n")
cat("standar deviasi banyak kematian akibat kanker tulang ", σ)

# 2.f. Gambarkan histogram pendistribusian banyak banyak kematian akibat kanker tulang untuk pekerja pabrik ban.
λ <- 1.8  
hist(rpois(10000, λ), 
     xlab = "Jumlah Kematian", main = "Histogram Kematian akibat Kangker Tulang")

# 2.g. Gunakan simulasi untuk memeriksa hasil sebelumnya.
λ <- 1.8  
data <- rpois(10000, λ)
print(data)

# 2.h. Jelaskan banyak kematian akibat kanker tulang berdasarkan simulasi Anda. Bandingkan jawaban pada pertanyaan 2d dengan hasil simulasi Anda.
λ <- 1.8  
data <- rpois(10000, λ)
result <- sum(data > 4) / length(data)
print(result)
# hasil yang didapatkan adalah 0.0378. Hasil tersebut tidaklah jauh dari hasil dari nomer 2.d. yaitu 0.03640666

#############################################################

# 3. Diketahui nilai x = 3 dan v = 10. Tentukan:

# 3.a. Fungsi probabilitas dari distribusi Chi-Square.
x <- 3
v <- 10
probabilitas <- dchisq(x, df = v)
print(probabilitas)

# 3.b. Histogram dari distribusi Chi-Square dengan 500 data acak.
x <- 3
v <- 10
hist(rchisq(500, x, df = x), main = "Distribusi Chi-Square")

# 3.c. Nilai rataan (μ) dan varian (σ2) dari distribusi Chi-Square.
x <- 3
v <- 10
µ <- v
σ2 <- 2 * v
cat("Nilai rataan (μ) dari distribusi Chi-Square adalah ", µ, "\n")
cat("Nilai dari distribusi Chi-Square adalah ", σ2, "\n")

#############################################################

# 4. Diketahui data bangkitan acak sebanyak 100 dengan mean = 45 dan sd = 5. Tentukan:

# 4.a. Fungsi probabilitas dari distribusi Normal P(X1 ≤ x ≤ X2), hitung z-scorenya dan plot data bangkitan acaknya dalam bentuk grafik. Petunjuk (gunakan fungsi plot()).
set.seed(1) 
x1 <- 44
x2 <- 46
µ <- 45
σ <- 5
z1 <- (x1 - µ) / σ
z2 <- (x2 - µ) / σ
data <- rnorm(100, mean = µ, sd = σ)
plot(density(data), main = "Distribusi Normal", xlab = "Nilai Data")
abline(v = x1)
abline(v = x2)

# 4.b. Gambarkan histogram dari distribusi Normal dengan breaks 50
set.seed(1) 
µ <- 45
σ <- 5
data <- rnorm(100, mean = µ, sd = σ)
hist(data, breaks = 50, main = "Histogram Distribusi Normal")

# 4.c. Nilai varian (σ2) dari hasil data bangkitan acak distribusi Normal.
set.seed(1) 
µ <- 45
σ <- 5
data <- rnorm(100, mean = µ, sd = σ)
σ2 <- var(data)
print(σ2)

#############################################################

# 5. Kerjakanlah menggunakan distribusi T-Student.

# 5.a. Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -2,34 dengan 6 derajat kebebasan?
x <- -2.34
df <- 6
probabilitas <- pt(x, df = df)
print(probabilitas)

# 5.b. Berapa probabilitas terjadinya suatu peristiwa acak X lebih dari 1,34 dengan 6 derajat kebebasan?
x <- 1.34
df <- 6
probabilitas <- pt(x, df = df, lower.tail = FALSE)
print(probabilitas)

# 5.c. Berapa probabilitas terjadinya suatu peristiwa acak X kurang dari -1,23 atau lebih besar dari 1,23 dengan 3 derajat kebebasan?
x1 <- -1.23
x2 <- 1.23
df <- 3
probabilitas <- pt(x1, df = df) + pt(x2, df = df, lower.tail = FALSE)
print(probabilitas)

# 5.d. Berapa probabilitas terjadinya suatu peristiwa acak X berada di antara -0,94 dan 0,94 dengan 14 derajat kebebasan?
x1 <- -0.94
x2 <- 0.94
df <- 14
probabilitas <- pt(x2, df = df) - pt(x1, df = df)
print(probabilitas)

# 5.e. Berapa nilai t-score dengan 5 derajat kebebasan yang memiliki luasan 0,0333 satuan persegi di bawah kurva dan di sebelah kiri t-score tersebut?
df <- 5        
alpha <- 0.0333
t_score <- qt(alpha, df = df)
print(t_score)

# 5.f. Berapa nilai t-score dengan 25 derajat kebebasan yang memiliki luasan 0,125 satuan persegi di bawah kurva dan di sebelah kanan t-score tersebut?
df <- 25  
alpha <- 0.125
t_score <- qt(alpha, df = df, lower.tail = FALSE)
print(t_score)

# 5.g. Berapa nilai t-score dengan 11 derajat kebebasan yang memiliki luasan 0,75 satuan persegi di bawah kurva dan di antara t-score tersebut dan negatif dari nilai t-score tersebut?
df <- 11
alpha <- 0.75
t_score <- qt(alpha, df = df)
negative_t_score <- qt(1 - alpha, df = df)
print(t_score)
print(negative_t_score)

# 5.h. Berapa nilai t-score dengan 23 derajat kebebasan yang memiliki luasan 0,0333 satuan persegi di bawah kurva dan di luar interval antara t-score tersebut dan negatif dari nilai t-score tersebut?
df <- 23
alpha <- 0.0333
t_score <- qt(alpha, df = df)
negative_t_score <- qt(1 - alpha, df = df, lower.tail = FALSE)
print(t_score)
print(negative_t_score)
