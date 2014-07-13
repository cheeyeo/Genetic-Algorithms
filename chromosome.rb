class Chromosome
  attr_accessor :bitstring

  def fitness
    @fitness = @bitstring.to_i(2) ^ 0b1010
  end

  def self.random_chromosomes(length, number)
    return Array.new(length) { Chromosome.new(length) }
  end

  def initialize(length, bitstring = nil)
    if bitstring
      @bitstring = bitstring
    else
      @bitstring = rand(2**length+1).to_s(2).rjust(length, '0')
    end
    fitness
  end

  def self.fitnesses(chrs)
    chrs.each do |c|
      c.fitness
    end
  end

  def self.total_fitness(chrs)
    total = 0
    chrs.each do |c|
      total += chrs.fitness
    end
    return total
  end

  def self.roulette(chrs)
    roulette=[]
    chrs.each { |chr|
       chr.fitness.times { roulette << chr }
    }
    roulette.sample
  end

  def self.produce_new(chrs)
    newchrs = []
    chrs.each do |c|
      newchrs.push(roulette(chrs))
    end
    fitnesses(newchrs)

    return newchrs
  end

  def cross(mate)
    cs = crossover_site = rand(@bitstring.length-1)+1

    mate.bitstring[cs..-1], @bitstring[cs..-1] = @bitstring[cs..-1], mate.bitstring[cs..-1]
  end

  def self.do_crossings(chrs, mates)
    i = 0
    completed = []

    #not very idiomatic, but, the i variable is important
    while i < chrs.length
      #due to the symmetric nature of the data structure we're using
      if completed.include? i
        i += 1
        next
      end

      chrs[i].cross(chrs[mates[i]])

      completed.push(mates[i])
      i += 1
    end
    return chrs
  end

  def self.get_mates(chrs)
    i = 0
    res = {}
    while i < chrs.length
      res[i] = i+1
      res[i+1] = i
      i += 2
    end

    res
  end
end

i = 0

chrs = Chromosome.random_chromosomes(4, 4)

100.times do
  chrs = Chromosome.produce_new(chrs)
  mates =  Chromosome.get_mates(chrs)
  chrs = Chromosome.do_crossings(chrs, mates)
  puts "CROSSINGS:\n#{chrs.inspect}"
end

puts "RES:\n"
puts chrs.inspect
