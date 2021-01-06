class Restaurant < ApplicationRecord
    belongs_to :cuisine

    validates :name, :cuisine, :description, presence: true
    validates :cuisine, uniqueness: {scope: :name, message: 'with that name has already been taken'}
    validates :name, confirmation: true
    validates :name, two_word: true
    #validates_presence_of :name, :cuisine, :description
    # validates :price, numericality: {greater_than: 0, less_than: 5, message: "must be between 1 and 4"}
    # validates_uniqueness_of :cuisine, scope: :name, message: 'with that name has already been taken'
    
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
        "#{self.name} - #{self.cuisine.name}"
    end

    def generate_stars 
        if self.rating == 1 
            "⭐️"
        elsif self.rating == 2
            "⭐️⭐️"
        elsif self.rating == 3
            "⭐️⭐️⭐️"
        elsif self.rating == 4
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
