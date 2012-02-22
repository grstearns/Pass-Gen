# Based on http://stackoverflow.com/questions/88311/how-best-to-generate-a-random-string-in-ruby
module RandString
  def rand(opts={})
    size = opts[:size] || 64
    char_ranges = opts[:char_ranges] || [('a'..'z'),('A'..'Z')]
    rand = opts[:rand] || Random.new

    o =  char_ranges.map(&:to_a).flatten;  
    string  =  (1..size).map{ o[rand.rand(o.length)]  }.join;
  end

  def hex(opts={})
    opts[:char_ranges] = [('A'..'F'),('0'..'9')]
    rand opts
  end

  def printable(opts={})
    opts[:char_ranges] = [(32..126).map(&:chr)]
    rand opts
  end
end