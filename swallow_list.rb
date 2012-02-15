wordfile = '20k.txt'

File.readlines(wordfile).each do |line|
  	stripped = line.strip
  	word_array = stripped.split /\|/

	word = Word.from_names(:word => word_array[0], :part_of_speech => word_array[1])
	word.save
end
