require_relative "keys.rb"

key = ARGV[1]
file = ARGV[0]

if !key || !file
	p "Usage: ruby ./decrypt file.txt PASSWORD"
	exit
end

def decrypt_file(key, file)
	encryption = ""
	decrypted_string = ""
	base_ten = ""

	passkey = make_passkey(key)
	master_key = make_master_key(passkey)

	File.open(file).readlines.each do |line|
		encryption = encryption + line
	end

	decryption = encryption.split("w")

	begin
			decryption.each do |letter|
				decrypted_string = decrypted_string + ((letter.to_i(32).to_s(10).to_i) / master_key).chr
			end
		rescue
			p "WRONG PASSWORD!"
	end
	print decrypted_string
	file = file.split(".")[0] + ".decrypted.txt"
	File.open(file, 'w') { 	|file| 
		file.write(decrypted_string)

	}
	return (decrypted_string)
end

decryption = decrypt_file(key, file)








