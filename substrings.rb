def substrings(string, dictionary)
  results = Hash.new(0)
  string.downcase!
  
  dictionary.each do |word|
    hits = string.scan(word).size
    if hits > 0
      results[word] = hits
    end
  end
  
  p results
  
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)