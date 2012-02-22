# Based on http://stackoverflow.com/questions/88311/how-best-to-generate-a-random-string-in-ruby
module RandString
  def self.alpha
    opts[:char_ranges] = [('a'..'z'),('A'..'Z')]
    rand opts
  end

  def self.alphanum(opts={})
    opts[:char_ranges] = [('a'..'z'),('A'..'Z'),('0'..'9')]
    rand opts
  end
  
  def self.hex(opts={})
    opts[:char_ranges] = [('A'..'F'),('0'..'9')]
    rand opts
  end

  def self.printable(opts={})
    opts[:char_ranges] = [(32..126).map(&:chr)]
    rand opts
  end

  
  def self.rand(opts={})
    size = opts[:size] || 64
    char_ranges = opts[:char_ranges]
    rand = opts[:rand] || Random.new

    o =  char_ranges.map(&:to_a).flatten;  
    string  =  (1..size).map{ o[rand.rand(o.length)]  }.join;
  end
end