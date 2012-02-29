require "rand_string"
require "koremu"

class PasswordController < ApplicationController
  before_filter do
    @ran = Crypt::ISAAC.new
  end

  def index

  	#
  	@nouns = Word.random(tags: 'Noun', rand: @ran)
  	@adjectives = Word.random(tags: 'Adjective', rand: @ran)
  	@verbs = Word.random(tags: 'Verb', rand: @ran)

  	@table = @verbs.zip @adjectives, @nouns

  	#
  	@rand_string = RandString::alphanum(rand: @ran)
  	@rand_hex = RandString::hex(rand: @ran)
  	@rand_printable = RandString::printable(rand: @ran)

  	#
    @pin = Array.new
  	4.times{ @pin << @ran.rand(9999) }

  	#
  	@kore = Array.new
  	4.times{ @kore << KoremuFixnum.new(@ran.rand(9999999)).to_ks }
  end

  def word
    tags = params[:tag] || params[:tags].to_a.map { |t| t.titlecase }
    count = params[:count] || 1

    @words = Word.random(tags: tags, count: count, rand: @ran)
    
    respond_to do |format|
      format.html
      # format.js
      format.xml { render :xml => @words.to_xml }
    end
  end

  def kore
    length = params[:length] || 8
    
    @k_num = @ran.rand((10**length)-1)
    @kore = KoremuFixnum.new(@k_num).to_ks

    respond_to do |format|
      format.html
      # format.js
      format.xml { render :xml => "<koremutake><string>#{@kore}</string><number>#{@k_num}</number></koremutake>" }
    end
  end

  


end
