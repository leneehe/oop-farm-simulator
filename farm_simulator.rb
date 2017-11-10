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
      puts "field -> adds a new field"
      puts "harvest -> harvests crops and adds to total harvested"
      puts "status -> displays some information about the farm"
      puts "relax -> provides lovely descriptions of your fields"
      puts "exit -> exits the program"
      puts "~" * 30
      selection
    end
  end

  def selection
    user_input = gets.chomp
    case user_input
    when "field"
      add_field
    when "harvest"
      Field.harvest
    when "status"
      Field.status
    when "relax"
      Field.relax
    when "exit"
      exit
    else
      puts "That's not possible with your farm! Select again."
      selection
    end
  end

  def add_field
    puts "What kind of field is it? Corn or wheat?"
    user_field = gets.chomp
    puts "How large is the field in hectares?"
    user_hectares = gets.chomp.to_i
    case user_field
    when "corn"
      Corn.new(user_hectares)
    when "wheat"
      Wheat.new(user_hectares)
    else
      puts "Not a valid field!"
    end
  end

end
