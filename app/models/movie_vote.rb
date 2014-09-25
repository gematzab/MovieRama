class MovieVote < ActiveRecord::Base
	belongs_to :user
	belongs_to :movie

	scope :number_of_likes, lambda {|movieid| 
		 where(:movie_id=>movieid, :like=>true) }

	scope :who_likes, lambda { where(:like=>true) }
end
