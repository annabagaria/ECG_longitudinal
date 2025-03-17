con <- file("ECGPCG0003.dat", "rb") # connection object

# Leer los datos
data <- readBin(con, what = "integer", size = 2, n = 240000*2, signed = TRUE, endian = "little")

# Cerrar la conexión
close(con)

head(data)

# Extraer ECG (valores en posiciones pares), los datos estan intercalados
ecg <- data[seq(1, length(data), by = 2)]


# Definir frecuencia de muestreo (8000 Hz)
fs <- 8000  

# Crear vector de tiempo
t <- seq(0, (length(ecg) - 1)) / fs

plot(t, ecg, type = "l", main = "Señal ECG con tiempo", xlab = "Tiempo (s)", ylab = "Amplitud (µV)")
plot(t[1:8000], ecg[1:8000], type = "l", main = "Señal ECG con tiempo", xlab = "Tiempo (s)", ylab = "Amplitud (µV)")


################################################################################

dat <- data.frame(t, ecg)


library(pracma)

# Detectar picos R

r_peaks <- findpeaks(ecg, nups = 1, minpeakheight = 20000, minpeakdistance = 1000)


# Extraer tiempos de los picos
r_times <- t[r_peaks[,2]]

# Graficar ECG con los picos R resaltados
plot(t, ecg, type = "l", main = "ECG con picos R detectados", xlab = "Tiempo (s)", ylab = "Amplitud (µV)")
points(r_times, ecg[r_peaks[,2]], col = "red", pch = 19)










