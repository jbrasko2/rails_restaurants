class Restaurant < ApplicationRecord

    def self.sort_by_rating
        # self.all.sort_by{|restaurant| restaurant.rating }.reverse
        self.order(rating: :desc)
    end

    def self.sort_by_price
        self.order(price: :desc)
    end

    def self.high_dollar
        # self.all.select {|restaurant| restaurant.price == 4 }
        # byebug
        self.where(price: 4)
    end

    def name_and_cuisine
        "#{self.name} - #{self.cuisine}"
    end

    def generate_stars 
        if self.rating == 1 
            "⭐️"
        elsif self.rating == 2
            "⭐️⭐️"
        elsif self.rating == 2
            "⭐️⭐️⭐️"
        elsif self.rating == 2
            "⭐️⭐️⭐️⭐️"
        else
            "⭐️⭐️⭐️⭐️⭐️"
        end
    end

    def generate_dollarsigns
        if self.price == 1 
            "$"
        elsif self.price == 2
            "$$"
        elsif self.price == 3
            "$$$"
        else
            "$$$$"
        end
    end
end
