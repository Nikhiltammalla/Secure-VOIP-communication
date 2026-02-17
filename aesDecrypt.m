function decrypted = aesDecrypt(encryptedData, key)
    cipher = javax.crypto.Cipher.getInstance('AES/ECB/PKCS5Padding');
    secretKey = javax.crypto.spec.SecretKeySpec(key, 'AES');
    cipher.init(javax.crypto.Cipher.DECRYPT_MODE, secretKey);
    decrypted = typecast(cipher.doFinal(encryptedData), 'uint8');
end