class Field
@@all_fields = []
@@total_harvested = 0
  def initialize(type, hectare, amount)
    @type = type
    @hectare = hectare
    @amount = amount

    @@all_fields << self
    puts "Added a #{@type} field of #{@hectare} hectares!"
  end

# Instance method reader
  def type
    @type
  end

  def area
    @hectare
  end

  def amount
    @amount
  end

# Class methods

  def self.status
    @@all_fields.each do |field|
      puts "#{field.type} field is #{field.area} hectares."
    end
    puts "The farm has #{@@total_harvested} harvested food so far."
  end

  def self.harvest
    @@all_fields.each do |field|
      @@total_harvested += field.amount * field.area
      puts "Harvesting #{field.amount * field.area} food from #{field.area} hectare #{field.type} field."
    end
    puts "The farm has #{@@total_harvested} harvested food so far."
    return @@total_harvested
  end

  def self.relax
    @@all_fields.each do |field|
      if field.type == "corn"
        puts "#{field.area} hectares of tall green stalks rustling in the breeze fill your horizon."
      elsif field.type == "wheat"
        puts "The sun hangs low, casting an orange glow on a sea of #{field.area} hectares of wheat."
      end
    end
    return nil
  end
end

class Corn < Field
CORN_AMOUNT = 20
  def initialize(hectare)
    super("corn", hectare, CORN_AMOUNT)
  end
end

class Wheat < Field
WHEAT_AMOUNT = 30
  def initialize(hectare)
    super("wheat", hectare, WHEAT_AMOUNT)
  end

end
