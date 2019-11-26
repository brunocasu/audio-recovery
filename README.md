# audio-recovery
Digital audio analyzer that implement filters for noise suppression in the audio signal

The folder Noise_Generator contains the MatLab files that implement a function to insert noise signal (sine waves) in the Audio file. For each 30 second section a different range of frquencies will be added.
Note that the generator will limit the Audio file to 5 minutes long. The input file must be a .mp3 or .wav extension. Output file is: 'AudioWithNoise.wav'

The folder Audio_Recovery contains the MatLab files that implement an audio recovery process. The function reconstruct each segment of 30 seconds using the FFT operation, and analyses the frequency spectrum. The function has a threshold, in whch it detects high peaks to locate the frequency of the noise in the channel. After that the function builds a Reject Band Filter (second order) with the range found in the previous step. Then a convolution is done between the filter and that 30 second section, recovering that specific section. The same process is done for every 30 second section and for each channel (Left and Right). The recovered audio file 'RecoveredAudio.wav' is generated at the end of operation.
