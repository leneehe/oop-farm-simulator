require_relative 'field.rb'

class Farm
  def initialize
    puts "Welcome to your new farm!"
    menu
  end

  def menu
    loop do
      puts "~" * 30
      puts "What would you like to do today?"
      puts "1. field -> adds a new field"
      puts "2. harvest -> harvests crops and adds to total harvested"
      puts "3. status -> displays some information about the farm"
      puts "4. relax -> provides lovely descriptions of your fields"
      puts "5. exit -> exits the program"
      puts "~" * 30
      selection
    end
  end

  def selection
    user_input = gets.chomp
    case user_input
    when "1", "field"
      add_field
    when "2", "harvest"
      Field.harvest
    when "3", "status"
      Field.status
    when "4", "relax"
      Field.relax
    when "5", "exit"
      exit
    else
      puts "That's not possible with your farm! Select again."
      selection
    end
  end

  def add_field
    puts "What kind of field is it? Corn, wheat or rice?"
    user_field = gets.chomp
    case user_field
    when "corn", "wheat", "rice"
      puts "How large is the field in hectares?"
      user_hectares = gets.chomp.to_i
      if user_field == "corn" && user_hectares > 0
        Corn.new(user_hectares)
      elsif user_field == "wheat" && user_hectares > 0
        Wheat.new(user_hectares)
      elsif user_field == "rice" && user_hectares > 0
        Rice.new(user_hectares)
      else
        puts "Bad input!"
      end
    else
      puts "Not a valid field!"
      add_field
    end
  end
end

Farm.new
