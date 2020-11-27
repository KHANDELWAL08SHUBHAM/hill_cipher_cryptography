
% Matlab program for encryption and decryption of a message using hill cipher cryptography. %

% A project by Shubham Khandelwal %

% The values corresponding to the alphabets are given below. %
% a=0,b=1,c=2,d=3,e=4,f=5,g=6,h=7,i=8,j=9,k=10,l=11,m=12,n=13,o=14,p=15,q=16,r=17,s=18,t=19,u=20,v=21,w=22,x=23,y=24,z=25 %


% loop to run the program continuously %

while 1                                                  
    fprintf('\n\n');
fprintf(' ________________________ Welcome to the Hill - Cipher cryptography program ________________________________'); 

fprintf('\n\n Enter 1 to continue the program else press any other digit.\n\n');
prompt = 'Enter your choice? \n';
choice = input(prompt);
if choice==1
    encdec();
else
    fprintf('\n\n Thank you \n\n');
    break;
end
end


% function for encryption and decryption of message %

function encdec()

%_____________________________________________Encryption___________________________________________%

prompt = 'Enter the message you want to encrypt? (Enter in the group of 3 letters.) \n';
orig_text = input(prompt,'s');                       % take the input from the user %
orig_text= orig_text(~isspace(orig_text));           % remove the spaces %
orig_text= double(orig_text);                        % change the characters into ascii values %
len=numel(orig_text);                                % get the length of the message %
orig_text_nums=zeros(len,1);
for i=1:1:len                                        % loop to change the ascii values to values corresponding to letters %
    orig_text_nums(i)=mod(orig_text(i),97);
end

orig_text_nums=reshape(orig_text_nums,3,1);          % change the dimensions of the matrix to 3x1 %
fprintf('\n\n The matrix formed from the letters of message is:\n');                % display the matrix formed from the letters %
disp(orig_text_nums);

key = 'ciphering';

fprintf('\n The symmetric key used in both encryption and decryption is:\n');       % display the symmetric key %
disp(key);

key=double(key);                                                                     % change the letters of key into ascii values %
keylen=numel(key);
for j=1:keylen                                                   % loop to change the ascii values to values corresponding to letters %
    key(j)=mod(key(j),97);
end

key = reshape(key,3,3);                                         % change the dimensions of the matrix into 3x3 %
key=key';



fprintf('\n\n The key matrix used for encryption is: \n');                 % display the 3x3 key matrix %
disp(key);

cipher_num = mod(key*orig_text_nums,26);                                    % get the encrypted matrix %

fprintf('\n\n The cipher matrix is: \n');
disp(cipher_num);

cipher_num_totext = cipher_num;

for k=1:len
    cipher_num_totext(k)=cipher_num(k)+97;
end

cipher_num_totext=reshape(cipher_num_totext,1,3);                            % change the dimension from 3x1 to 1x3 %   
cipher_text=char(cipher_num_totext);                                         % change the numbers to letters %

fprintf('\n\n The cipher text(encrypted message) is: \n');                    % display the encrypted matrix %
disp(cipher_text);



%__________________________________________Decryption_____________________________________________%

mul_fact = 5; % for determinant value of 1243 %

adj_key = adjoint(key);                                                     % find the adjoint of the key matrix %
adj_key_pos = adj_key + (26*15);                                   % change all the negative elements into positive elements if any %
decrypt_key = mul_fact*adj_key_pos;                                % find the inverse of the key or decryption key %

decrypt_key = mod(decrypt_key,26);


decrypt_num = decrypt_key*cipher_num;                              % multiply the decryption key and the encrypted matrix %
decrypt_num = reshape(decrypt_num,1,3);                            % change the dimensions of the matrix %
decrypt_num = mod(decrypt_num,26);

decrypt_num_totext = decrypt_num;

fprintf('\n\n The deciphered matrix(decrypted matrix) is: \n');            % print the deciphered matrix %
disp(decrypt_num);

for k=1:len                                                                % loop to change the values of matrix to ascii values %
    decrypt_num_totext(k)=decrypt_num(k)+97;
end


decrypt_text = char(decrypt_num_totext+0.05);                              % change the ascii values to text (0.05 added because without it some error may occur in decryption of some letters %

fprintf('\n\n The deciphered text(decrypted message) is: \n');             % display the decrypted message %
disp(decrypt_text);

end






