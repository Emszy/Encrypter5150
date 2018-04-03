
def q_pow(pow, length)

	total = pow
	while length > 0 do
		total = total * pow 
		length = length - 1
	end
	return total
end

def r_pow(pow, length, key)

	total = key
	x = 0
	while x <= length do
		total = total / pow 
		x = x + 1
	end
	return total
end

def make_passkey(key)
	tmp = ""
	prime = 17
	passkey = []
	key.each_char do |char|
		passkey.push(char.ord * q_pow(prime, key.length ))
		tmp = char.ord * q_pow(prime, key.length)
		p tmp
		p r_pow(prime, key.length , tmp.to_i)
	end
	return (passkey)
end

def make_master_key(passkey)
	master_key = 17
	passkey.each do |key_link|
		master_key = master_key * key_link.to_i
	end
	return (master_key)
end
