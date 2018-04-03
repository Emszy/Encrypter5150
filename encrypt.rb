require_relative "keys.rb"

key = ARGV[1]
file = ARGV[0]

if !key || !file
	p "Usage: ruby ./encrypt file.txt PASSWORD"
	exit
end

def encrypt_file(file, key)

	encryption = ""
	passkey = make_passkey(key)
	master_key = make_master_key(passkey)
	encrypted_file = file.split(".")[0] + ".encrypted"
	File.open(file).readlines.each do |line|
	 	line.each_char do |char|
	 		encryption = encryption + (char.ord.to_i * master_key / 30).to_s(32)
	 		encryption = encryption + "w"
	 	end
	end

	File.open(encrypted_file, 'w') { 	|file| 
	
		file.write(encryption) 
	}
 	return (encryption)
end


encryption = encrypt_file(file, key)





