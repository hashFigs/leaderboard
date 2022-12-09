class User < ApplicationRecord
 has_many :ratings

 validates :login, presence: true
end
