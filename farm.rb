require "./field.rb"
require "./pasture.rb"

class Farm


    def initialize
        @@total_harvested_food = 0
        @@cow = 0
        @@pig = 0
        @@chicken = 0
    end

    def self.cow
        return @@cow
    end

    def self.pig
        return @@pig
    end

    def self.chicken
        return @@chicken
    end

    def main_menu
        # loop do
            # get input
            # if input invalid, continue
            # call_option with input
        loop do
            print_main_menu
            user_selected = gets.to_i
            next if user_selected < 1 || user_selected > 7
            call_option(user_selected)
        end
      end

    def print_main_menu
        puts '[1] Add a new field'
        puts '[2] Add a new pasture'
        puts '[3] Harvests food'
        puts '[4] Breed animals'
        puts '[5] Status'
        puts '[6] Relax'
        puts '[7] Exit'
        puts 'Enter a number: '
    end

      def call_option(user_selected)
        case user_selected
          when 1 then add_new_field
          when 2 then add_new_pasture
          when 3 then harvest_crops
          when 4 then breed_animals
          when 5 then status
          when 6 then relax
          when 7 then exit

        end
      end

      def add_new_field
        type = nil
        hectares = -1
        while type != 1 && type != 2 && type != 3
            puts "----------------------------------"
            puts "What type of crop will this field grow?"
            puts '[1] Wheat'
            puts '[2] Corn'
            puts '[3] Rice'
            print "> "
            type = gets.chomp.to_i
            if type == 1
                crop = "wheat"
            end
            if type == 2
                crop = "corn"
            end
            if type == 3
                crop = "rice"
            end
        end

        while hectares <= 0
            puts "----------------------------------"
            puts "How many hectares is this new field?"
            print "> "
            hectares = gets.chomp.to_i
        end
        
        new_field = Field.create(crop, hectares)
        puts "------------"
        puts "New #{new_field.hectares} hectare #{new_field.crop} field created!"
        puts "------------"
        return new_field
      end

      def add_new_pasture
        type = nil
        hectares = -1
        while type != 1 && type != 2 && type != 3
            puts "----------------------------------"
            puts "What type of animal will this pasture raise?"
            puts '[1] Cow'
            puts '[2] Pig'
            puts '[3] Chickens'
            print "> "
            type = gets.chomp.to_i
            if type == 1
                breed = "cow"
            end
            if type == 2
                breed = "pig"
            end
            if type == 3
                breed = "chicken"
            end
        end

        while hectares <= 0
            puts "----------------------------------"
            puts "How many hectares is this new pasture?"
            print "> "
            hectares = gets.chomp.to_i
        end
        
        new_pasture = Pasture.create(breed, hectares)
        puts "------------"
        puts "New #{new_pasture.hectares} hectare #{new_pasture.breed} field created!"
        puts "------------"
        if breed == "cow"
            @@cow += new_pasture.hectares * new_pasture.amount_per_hectare
        end
        if breed == "pig"
            @@pig += new_pasture.hectares * new_pasture.amount_per_hectare
        end
        if breed == "chicken"
            @@chicken += new_pasture.hectares * new_pasture.amount_per_hectare
        end
        return new_pasture
      end
      
      def harvest_crops
        puts "----------------------------------"
        puts Field.harvest_wheat_message
        puts Field.harvest_corn_message
        puts Field.harvest_rice_message
        @@total_harvested_food += Field.harvest_all_corn + Field.harvest_all_wheat + Field.harvest_all_rice
        puts "The farm has harvested #{@@total_harvested_food} food so far!"
        puts "----------------------------------"
      end

      def breed_animals
        @@cow = (@@cow * 1.5).to_i
        @@pig = (@@pig * 1.5).to_i
        @@chicken = (@@chicken * 1.5).to_i
        puts "----------------------------------"
        puts "* Total cows now #{Farm.cow}."
        puts "* Total pigs now #{Farm.pig}."
        puts "* Total chickens now #{Farm.chicken}."

        puts "----------------------------------"

      end

      def status
        puts "----------------------------------"
        puts "Farm Report:"
        puts "----------------------------------" ## Why does it output crop per hectare here??
        puts "* Fields: #{Field.all.length}"
        puts "* Pastures: #{Pasture.all.length}"
        puts "* Total Hectares: #{Field.wheat_hectares + Field.corn_hectares + Field.rice_hectares}"
        puts "* Total Food: #{Field.total_wheat + Field.total_corn} + #{Field.total_rice} + #{Pasture.total_cow + Pasture.total_chicken} + #{Pasture.total_pig}"
        puts "* Food harvested so far: #{}"
        puts "--------------WHEAT---------------"
        puts "* Wheat Fields: #{Field.wheat_fields.length}"
        puts "* Total Wheat Hectares: #{Field.wheat_hectares}"
        puts "* Total Wheat Crops: #{Field.total_wheat}"
        puts "--------------CORN--------------"
        puts "* Corn Fields: #{Field.corn_fields.length}"
        puts "* Total Corn Hectares: #{Field.corn_hectares}"
        puts "* Total Corn Crops: #{Field.total_corn}"
        puts "--------------RICE----------------"
        puts "* Rice Fields: #{Field.rice_fields.length}"
        puts "* Total Rice Hectares: #{Field.rice_hectares}"
        puts "* Total Rice Crops: #{Field.total_rice}"
        puts "--------------COW----------------"
        puts "* Cow Pastures: #{Pasture.cow_fields.length}"
        puts "* Total Cow Hectares: #{Pasture.cow_hectares}"
        puts "* Total Cows: #{Farm.cow}"
        puts "------------CHICKEN---------------"
        puts "* Chickcn Pastures: #{Pasture.chicken_fields.length}"
        puts "* Total Chickcn Hectares: #{Pasture.chicken_hectares}"
        puts "* Total Chickcns: #{Farm.chicken}"
        puts "--------------PIG----------------"
        puts "* Pig Pastures: #{Pasture.pig_fields.length}"
        puts "* Total Pig Hectares: #{Pasture.pig_hectares}"
        puts "* Total Pigs: #{Farm.pig}"
        puts "----------------------------------"
        puts "* Total Harvested Food: #{@@total_harvested_food}"
        puts "----------------------------------"
      end

      def relax
        puts "----------------------------------"
        puts "#{Field.corn_hectares} hectares of tall green stalks rustling in the breeze fill your horizon."
        puts "The sun hangs low, casting an orange glow on a sea of #{Field.wheat_hectares} hectares of wheat."
        puts "The rustling of #{Field.rice_hectares} hectares of rice gently caresses your ears."
        puts "The soothing sounds of #{Pasture.pig_hectares} hectares of pigs wafts through the air."
        puts "Flocks of chickens dot #{Pasture.chicken_hectares} hectares of pasture."
        puts "Majestic cows graze on their #{Pasture.cow_hectares} hectares."
        puts "----------------------------------"
      end
end
