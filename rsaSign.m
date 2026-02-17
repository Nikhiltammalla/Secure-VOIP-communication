function signature = rsaSign(data, privateKey)
    sigObj = java.security.Signature.getInstance('SHA256withRSA');
    sigObj.initSign(privateKey);
    sigObj.update(data);
    signature = typecast(sigObj.sign(), 'uint8');
end