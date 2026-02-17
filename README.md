# 🔐 Secure VoIP Communication (MATLAB)

This project implements a **Secure Voice over IP (VoIP) communication
system** in MATLAB that transmits real‑time audio over a network while
ensuring:

-   Confidentiality (AES Encryption)
-   Authentication (RSA Digital Signature)
-   Integrity Verification

The system simulates a secure phone call between a **Sender** and a
**Receiver** using TCP sockets.

------------------------------------------------------------------------

## 📌 Project Overview

Traditional VoIP calls transmit audio packets that can be intercepted or
modified.\
This project protects voice data using a hybrid cryptography approach:

  Security Goal     Technique Used
  ----------------- ------------------------
  Confidentiality   AES‑128 Encryption
  Authentication    RSA Digital Signature
  Integrity         Signature Verification
  Transmission      TCP Socket Streaming

------------------------------------------------------------------------

## 🏗️ System Architecture

Microphone → Packetization → AES Encryption → RSA Signature → TCP
Transmission → Verification → Decryption → Speaker

------------------------------------------------------------------------

## 📂 Files Description

  File                      Purpose
  ------------------------- -------------------------------------------
  `SecureVOIP_Sender.m`     Records audio, encrypts and sends packets
  `SecureVOIP_Receiver.m`   Receives, verifies and plays audio
  `aesEncrypt.m`            AES encryption implementation
  `aesDecrypt.m`            AES decryption implementation
  `rsaSign.m`               Creates digital signature
  `rsaVerify.m`             Verifies authenticity of packets

------------------------------------------------------------------------

## 🔄 Working Principle

### Sender

1.  Records audio from microphone
2.  Splits audio into packets
3.  Encrypts packets using AES‑128
4.  Signs encrypted packets using RSA private key
5.  Sends packets over TCP

### Receiver

1.  Receives packets
2.  Verifies RSA signature
3.  Decrypts using AES key
4.  Reconstructs audio
5.  Plays the voice output

------------------------------------------------------------------------

## ⚙️ Requirements

-   MATLAB (with Audio Toolbox & Java support)
-   Two systems in same network OR localhost
-   Change receiver IP in sender file

Example: host = "192.168.1.100";

------------------------------------------------------------------------

## ▶️ How to Run

### Step 1 -- Start Receiver

Run: SecureVOIP_Receiver.m

### Step 2 -- Run Sender

Run: SecureVOIP_Sender.m

Speak into microphone → Secure audio playback at receiver.

------------------------------------------------------------------------

## 🧠 Concepts Used

-   Socket Programming
-   Symmetric Cryptography (AES)
-   Asymmetric Cryptography (RSA)
-   Digital Signatures
-   Real‑time Audio Processing
-   Packet Transmission

------------------------------------------------------------------------

## 🎯 Applications

-   Military communication systems
-   Secure voice chat applications
-   Telemedicine communication
-   Corporate confidential calls

------------------------------------------------------------------------

## 📌 Conclusion

This project demonstrates how combining **symmetric and asymmetric
cryptography** enables secure real‑time communication.\
AES ensures fast encryption while RSA guarantees authenticity and
integrity, making the VoIP transmission resistant to eavesdropping and
tampering.
