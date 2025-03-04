# DFT-Based-Digital-Watermarking
## **Overview**  
A **DFT-based watermarking system** that secures digital images by embedding an **imperceptible watermark** in the frequency domain. It prevents unauthorized use and verifies authenticity using **Mean Squared Error (MSE)** detection.  

## **Key Features**  
- **Secure Watermarking** – Embeds a watermark using **Discrete Fourier Transform (DFT)**.  
- **Tamper Detection** – Uses **MSE thresholding** to verify watermark presence.  
- **Minimal Distortion** – Ensures watermark is hidden yet detectable.  
- **User-Friendly** – Allows easy image selection, embedding, and verification.  

## **How It Works**  
1. **Preprocessing** – Loads and prepares the image.  
2. **Watermarking** – Embeds a binary watermark using **2D FFT**.  
3. **Verification** – Computes **MSE**; detects watermark if **MSE > threshold**.  
4. **Visualization** – Displays original, watermark, and watermarked images.  

