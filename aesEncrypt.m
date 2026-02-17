function encrypted = aesEncrypt(data, key)
    cipher = javax.crypto.Cipher.getInstance('AES/ECB/PKCS5Padding');
    secretKey = javax.crypto.spec.SecretKeySpec(key, 'AES');
    cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, secretKey);
    encrypted = typecast(cipher.doFinal(data), 'uint8');
end