# epilepsy_detection
EEG signals epilepsy detection by following steps:

  * Noise Removing by applying MSPCA algorithm.
  * Extract signals coefficients and details by applying wpd (Wavelet packet decomposition), dwt, emd and ceemdan algorithms.
  * Extract statistical features.
  * Feature selection by using binary gravitational search algorithm.
  * Final prediction by KNN,SVM,ANN and Random forest models.


Note: Please run Start.m file at first and then run main.m file.
__________________________________________________________________________________

Please check Papers directory For more information and further Readings.

<span style="font-size:0.7em;font-weight:800; color:navy;">CITATION:</span>
  
* Alickovic, E., Kevric, J., & Subasi, A. (2018). Performance evaluation of empirical mode decomposition, discrete wavelet transform, and wavelet packed decomposition for automated epileptic seizure detection and prediction. Biomedical signal processing and control, 39, 94-102.
  
* Rashedi, E., Nezamabadi-Pour, H., & Saryazdi, S. (2010). BGSA: binary gravitational search algorithm. Natural computing, 9, 727-745.


