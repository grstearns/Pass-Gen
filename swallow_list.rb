wordfile = '20k.txt'

File.readlines(wordfile).each do |line|
  	stripped = line.strip
  	word_array = stripped.split /\|/

	word = Word.create_from_names(:word => word_array[0], :tag => word_array[1])
end
