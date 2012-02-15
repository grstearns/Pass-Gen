# # require 'crypt-isaac'

# Array.class_eval do
#   def pick(count, random=Random.new)
#     shuffle(random: random).slice(0..count-1)
#   end

#   # def pick_secure(count)
#   #   pick(count, Crypt::ISAAC.new)
#   # end
# end