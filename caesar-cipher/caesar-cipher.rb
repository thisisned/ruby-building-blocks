def caesar_cipher(string, shift = 1) # Shift positive for rightwards, negative for leftwards
	shift = shift % 26 # Any shift over 26 gets modulo'd out
	coded_array = []
	string.scan(/./) do |char|
		new_ord = (char.ord + shift)
		if char =~ /[A-Z]/ # Regex: if the character is a captial letter
			unless (65..90).include?(new_ord)
				new_ord -= 26
			end
			coded_array << new_ord.chr
		elsif char =~ /[a-z]/ # Regex: if the character is a lower-case letter
			unless (97..122).include?(new_ord)
				new_ord -= 26
			end
			coded_array << new_ord.chr
		else coded_array << char
		end
	end
	p coded_array.join
end

caesar_cipher("Hey man, what's the big deal you sucker? 12345 YA YA YA YA ya ya eat it", 9)