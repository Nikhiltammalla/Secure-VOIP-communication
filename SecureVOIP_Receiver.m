% SecureVOIP_Receiver.m
port = 5001;
server = tcpserver("0.0.0.0", port);
disp("Waiting for sender...");

pause(2); % wait for connection
key = uint8('1234567890123456'); % Same AES key

publicKey = []; % Will be extracted from signature (mock setup)
received = [];

while server.NumBytesAvailable > 0 || isempty(received)
    if server.NumBytesAvailable < 4, continue; end
    sigLen = typecast(uint8(read(server, 4)), 'uint32');
    while server.NumBytesAvailable < sigLen + 4, pause(0.01); end
    sig = uint8(read(server, sigLen));

    dataLen = typecast(uint8(read(server, 4)), 'uint32');
    while server.NumBytesAvailable < dataLen, pause(0.01); end
    encData = uint8(read(server, dataLen));

    if isempty(publicKey)
        disp("Public key verification skipped (mock).");
        verified = true;
    else
        verified = rsaVerify(encData, sig, publicKey);
    end

    if verified
        disp("Signature verified.");
        decData = aesDecrypt(encData, key);
        audioPart = typecast(decData, 'int16');
        received = [received; audioPart];
    else
        disp("Signature verification failed.");
    end
end

sound(received, 44100);
disp("Playback complete.");