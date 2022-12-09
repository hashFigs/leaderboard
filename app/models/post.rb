class Post < ApplicationRecord
    has_many :ratings

    validates :title, :body, :user_id, :ip, presence: true
    

    def top_posts
        Post.find_by_sql("SELECT posts.* FROM posts 
            JOIN ratings ON ratings.post_id=posts.id 
            GROUP BY posts.id
            ORDER BY AVG(ratings.value) DESC
            LIMIT 20")
    end    
 

    def avg_rating
        ratings.average(:value) || 0
    end    
end
