# ECG_longitudinal
Prácticas de longitudinal

17/03/2025
A partir de la base de datos abierta "EPHNOGRAM: A Simultaneous Electrocardiogram and Phonocardiogram Database", primero vamos a calcular los picos R en un electrocardiograma para después poder calcular los intervalos RR.

Empezamos el proyecto leyendo los datos del fichero .dat. Utilizamos la función "readBin" y ayudandonos del fichero .hea leemos los datos. Los datos contienen ECG y PCG intercalados. Nos interesan solo los ECG, los separamos y los graficamos. El archivo de R donde he hecho esto se llama read_data.R.

Después, en el mismo archivo, utilizamos la librería "pracma" para encontrar los picos R, y también graficarlos.
