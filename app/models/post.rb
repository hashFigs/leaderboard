class Post < ApplicationRecord
    has_many :ratings

    def avg_rating
        ratings.average(:value)
    end    
end
