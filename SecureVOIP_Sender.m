% SecureVOIP_Sender.m
host = "192.168.1.100";  % Change this to receiver IP
port = 5001;
recObj = audiorecorder(44100, 16, 1);
disp('Recording for 10 seconds...');
recordblocking(recObj, 10);
y = getaudiodata(recObj, 'int16');
sound(y, 44100);

key = uint8('1234567890123456'); % AES 128-bit key

% Generate RSA keys for this example
keyPairGen = java.security.KeyPairGenerator.getInstance('RSA');
keyPairGen.initialize(2048);
keyPair = keyPairGen.generateKeyPair();
privateKey = keyPair.getPrivate();
publicKey = keyPair.getPublic();

packetSize = 4410;  % ~0.1s chunks
numPackets = ceil(length(y) / packetSize);
packets = mat2cell(y, repmat(packetSize, numPackets, 1), 1);
packets{end} = y((end-packetSize+1):end);  % ensure last packet fits

% Connect to receiver
client = tcpclient(host, port);
for i = 1:numPackets
    data = typecast(packets{i}, 'uint8');
    encData = aesEncrypt(data, key);
    sig = rsaSign(encData, privateKey);

    % Send: [signatureLen | signature | dataLen | encryptedData]
    write(client, typecast(uint32(length(sig)), 'uint8'));
    write(client, sig);
    write(client, typecast(uint32(length(encData)), 'uint8'));
    write(client, encData);
    pause(0.05);
end
clear client;
disp('All packets sent.');