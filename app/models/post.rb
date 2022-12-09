class Post < ApplicationRecord
    has_many :ratings
    
    #scope :by_score, :joins => :ratings, :group => "posts.id", :order => "AVG(ratings.value) DESC"
  

=begin
        SELECT posts.* FROM posts 
        JOIN ratings ON ratings.post_id=posts.id 
        GROUP BY posts.id
        ORDER BY AVG(ratings.value) DESC
        LIMIT 10   

=end
    def top_posts
        Post.find_by_sql("SELECT posts.* FROM posts 
            JOIN ratings ON ratings.post_id=posts.id 
            GROUP BY posts.id
            ORDER BY AVG(ratings.value) DESC
            LIMIT 10")
    end    
 

    def avg_rating
        ratings.average(:value) || 0
    end    
end
