module Char
  def Char.points(char)
    case char.downcase
      when /[aeilnorstu]/
        1
      when "d", "g"
        2
      when /[bcmp]/
        3
      when /[fhvwy]/
        4
      when "k"
        5
      when "j", "x"
        8
      when "q", "z"
        10
      else
        0
    end
  end

  def hand(char)
   case char.downcase
   when /[qwertasdfgzxcv12345\!\@\#\$\%\`\~]/
     :left
   when /[6^b ]/
     :either
    when /[yuiophjklnm7890\&\*\(\)\_\-\=\+\[\]\{\}\|\\\;\'\:\"\,\<\.\>\/\?]/
     :right
   end
  end

  # def Char.numeric?(char)
  #   (/[0-9]/ === char) != nil
  # end

  # def Char.special?(char)
  #   (/[A-Za-z0-9]/ === char) == nil
  # end
end