class Cuisine < ApplicationRecord
    has_many :restaurants # restaurnts & restaurnts.build
    validates :name, uniqueness: true, presence: true
    accepts_nested_attributes_for :restaurants

end

