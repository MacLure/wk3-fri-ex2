require "./farm.rb"

class Field

    @@fields = []
    @@corn_fields =  []
    @@wheat_fields =  []
    @@rice_fields =  []

    @@total_rice = 0
    @@total_wheat = 0
    @@total_corn = 0

    
    def self.all
        return @@fields
    end

    def self.wheat_fields
        @@fields.each do |field|
            if field.crop == "wheat"
                @@wheat_fields << field
            end
        end
        return @@wheat_fields
    end

    def self.corn_fields
        @@fields.each do |field|
            if field.crop == "corn"
                @@corn_fields << field
            end
        end
        return @@corn_fields
    end

    def self.rice_fields
        @@fields.each do |field|
            if field.crop == "rice"
                @@rice_fields << field
            end
        end
        return @@rice_fields
    end

    def self.total_corn
        total_corn = 0
        @@fields.each do |field|
            if field.crop == "corn"
                total_corn += field.amount_per_hectare
            end
        end
        return total_corn
    end

    def self.total_wheat
        total_wheat = 0
        @@fields.each do |field|
            if field.crop == "wheat"
                total_wheat += field.amount_per_hectare
            end
        end
        return total_wheat
    end

    def self.total_rice
        total_rice = 0
        @@fields.each do |field|
            if field.crop == "rice"
                total_rice += field.amount_per_hectare
            end
        end
        return total_rice
    end

    def self.corn_hectares
        total_corn = 0
        @@fields.each do |field|
            if field.crop == "corn"
                total_corn += field.hectares
            end
        end
        return total_corn
    end

    def self.wheat_hectares
        total_wheat = 0
        @@fields.each do |field|
            if field.crop == "wheat"
                total_wheat += field.hectares
            end
        end
        return total_wheat
    end

    def self.rice_hectares
        total_rice = 0
        @@fields.each do |field|
            if field.crop == "rice"
                total_rice += field.hectares
            end
        end
        return total_rice
    end

    def self.total_crops
        return @@total_wheat + @@total_corn + @@total_rice
    end
    
    def self.harvest_wheat_message
        output = "0 food harvested from wheat fields."
        @@fields.each do |field|
            if field.hectares * field.amount_per_hectare == nil
                output = "#{field.hectares * field.amount_per_hectare} food harvested from #{field.hectares} wheat field. \n"
            end
        end
        return output
    end

    def self.harvest_corn_message
        output = "0 food harvested from corn fields."
        @@fields.each do |field|
            if field.crop == "corn"
                output = "#{field.hectares * field.amount_per_hectare} food harvested from #{field.hectares} corn field. \n"
            end
        end
        return output
    end

    def self.harvest_rice_message
        output = "0 food harvested from rice fields."
        @@fields.each do |field|
            if field.crop == "rice"
                output = "#{field.hectares * field.amount_per_hectare} food harvested from #{field.hectares} rice field. \n"
            end
        end
        return output
    end

    def self.harvest_all_wheat
        harvested_wheat = 0
        @@fields.each do |field|
            if field.crop == "wheat"
                harvested_wheat += field.harvest
            end
        end
        return harvested_wheat
    end

    def self.harvest_all_corn
        harvested_wheat = 0
        @@fields.each do |field|
            if field.crop == "corn"
                harvested_wheat += field.harvest
            end
        end
        return harvested_wheat
    end

    def self.harvest_all_rice
        harvested_rice = 0
        @@fields.each do |field|
            if field.crop == "rice"
                harvested_rice += field.harvest
            end
        end
        return harvested_rice
    end

    def self.create(crop, hectares)
        new_field = Field.new(crop, hectares)
        @@fields << new_field
        return new_field
    end

    def initialize(crop, hectares)
        @crop = crop
        @hectares = hectares
        if @crop == "wheat"
            @amount_per_hectare = 30
        end
        if @crop == "corn"
            @amount_per_hectare = 20
        end
        if @crop == "rice"
            @amount_per_hectare = 50
        end
        
    end

    def crop
        return @crop
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