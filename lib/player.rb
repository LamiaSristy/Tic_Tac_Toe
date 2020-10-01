class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Player < Person
  attr_reader :sign
  def initialize(name, sign)
    super(name)
    @sign = sign
  end

  def print()
    puts "Name : #{@name}, Sign: #{@sign}"
  end
end
