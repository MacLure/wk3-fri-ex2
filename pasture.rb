
class Pasture

    @@fields = []
    @@pig_fields =  []
    @@cow_fields =  []
    @@chicken_fields =  []

    @@total_chicken = 0
    @@total_cow = 0
    @@total_pig = 0

    def self.all
        return @@fields
    end

    def breed
        Pature.total_chicken *= 2
        Pature.total_cow *= 2
        Pature.total_pig *= 2
    end

    def self.breed_messages
        puts "There are now #{@@total_chicken} chickens on the farm."
        puts "There are now #{@@total_cow} cows on the farm."
        puts "There are now #{@@total_pig} pigs on the farm."
    end

    def self.cow_fields
        @@fields.each do |field|
            if field.breed == "cow"
                @@cow_fields << field
            end
        end
        return @@cow_fields
    end

    def self.pig_fields
        @@fields.each do |field|
            if field.breed == "pig"
                @@pig_fields << field
            end
        end
        return @@pig_fields
    end

    def self.chicken_fields
        @@fields.each do |field|
            if field.breed == "chicken"
                @@chicken_fields << field
            end
        end
        return @@chicken_fields
    end

    def self.total_pig
        total_pig = 0
        @@fields.each do |field|
            if field.breed == "pig"
                total_pig += field.amount_per_hectare
            end
        end
        return total_pig
    end

    def self.total_cow
        total_cow = 0
        @@fields.each do |field|
            if field.breed == "cow"
                total_cow += field.amount_per_hectare
            end
        end
        return total_cow
    end

    def self.total_chicken
        total_chicken = 0
        @@fields.each do |field|
            if field.breed == "chicken"
                total_chicken += field.amount_per_hectare
            end
        end
        return total_chicken
    end

    def self.pig_hectares
        total_pig = 0
        @@fields.each do |field|
            if field.breed == "pig"
                total_pig += field.hectares
            end
        end
        return total_pig
    end

    def self.cow_hectares
        total_cow = 0
        @@fields.each do |field|
            if field.breed == "cow"
                total_cow += field.hectares
            end
        end
        return total_cow
    end

    def self.chicken_hectares
        total_chicken = 0
        @@fields.each do |field|
            if field.breed == "chicken"
                total_chicken += field.hectares
            end
        end
        return total_chicken
    end

    def self.total_breeds
        return @@total_cow + @@total_pig + @@total_chicken
    end
    
    def self.harvest_cow_message
        output = "0 food harvested from cow fields."
        @@fields.each do |field|
            if field.hectares * field.amount_per_hectare == nil
                output = "#{field.hectares * field.amount_per_hectare} food harvested from #{field.hectares} wheat field. \n"
            end
        end
        return output
    end

    def self.harvest_pig_message
        output = "0 food harvested from pig fields."
        @@fields.each do |field|
            if field.breed == "pig"
                output = "#{field.hectares * field.amount_per_hectare} food harvested from #{field.hectares} pig field. \n"
            end
        end
        return output
    end

    def self.harvest_chicken_message
        output = "0 food harvested from chicken fields."
        @@fields.each do |field|
            if field.breed == "chicken"
                output = "#{field.hectares * field.amount_per_hectare} food harvested from #{field.hectares} chicken field. \n"
            end
        end
        return output
    end

    def self.harvest_all_cow
        harvested_cow = 0
        @@fields.each do |field|
            if field.breed == "cow"
                harvested_cow += field.harvest
            end
        end
        return harvested_cow
    end

    def self.harvest_all_pig
        harvested_cow = 0
        @@fields.each do |field|
            if field.breed == "pig"
                harvested_cow += field.harvest
            end
        end
        return harvested_cow
    end

    def self.harvest_all_chicken
        harvested_chicken = 0
        @@fields.each do |field|
            if field.breed == "chicken"
                harvested_chicken += field.harvest
            end
        end
        return harvested_chicken
    end

    def self.create(breed, hectares)
        new_field = Pasture.new(breed, hectares)
        @@fields << new_field
        return new_field
    end

    def initialize(breed, hectares)
        @breed = breed
        @hectares = hectares
        if @breed == "cow"
            @amount_per_hectare = 5
        end
        if @breed == "pig"
            @amount_per_hectare = 10
        end
        if @breed == "chicken"
            @amount_per_hectare = 15
        end
        
    end

    def breed
        return @breed
    end

    def hectares
        return @hectares
    end

    def amount_per_hectare
        return @amount_per_hectare
    end

    def harvest
        return @hectares * @amount_per_hectare
    end



end