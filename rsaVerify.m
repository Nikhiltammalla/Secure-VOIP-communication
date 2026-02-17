function isValid = rsaVerify(data, signature, publicKey)
    sigObj = java.security.Signature.getInstance('SHA256withRSA');
    sigObj.initVerify(publicKey);
    sigObj.update(data);
    isValid = sigObj.verify(int8(signature));
end