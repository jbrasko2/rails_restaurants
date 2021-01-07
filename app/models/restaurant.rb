class Restaurant < ApplicationRecord
    belongs_to :cuisine # cuisine & cuisine=, build_cuisine methods
    validates :name, :cuisine, :description, presence: true
    validates :name, uniqueness: {scope: :cuisine, message: 'with that cuisine has already been taken'}
    validates :name, two_word: true
    # accepts_nested_attributes_for :cuisine # cuisine_attributes= 

    def cuisine_attributes=(attr)
        # find or create a cuisine by name
        if attr["name"].present?
            self.cuisine = Cuisine.find_or_create_by(attr)
        end
        # associate it with the restaurant
        # binding.pry
    end
    
    # validates :name, confirmation: true
    # accepts_nested_attributes_for :cuisine
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

    def filter(param)
          if param == "expensive"
            Restaurant.high_dollar.sort_by_rating
          elsif param == "price"
            Restaurant.sort_by_price
          elsif param != nil
            Restaurant.where('name Like ?', "%#{param}%")
          else
            Restaurant.sort_by_rating
          end
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
