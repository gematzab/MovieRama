class Movie < ActiveRecord::Base
	belongs_to :user
	has_many :movie_votes
	#has_many :users, :through => :movie_votes

	def self.scope_sort_by_selection_by_user(sort_param = nil, userid = nil)
		return order("movies.#{sort_param} DESC") if sort_param
    	return where(:user_id=>userid).order("movies.created_at ASC") if userid
    	all
  	end

	scope :order_by_likes_or_hates, lambda {|type| 
		select("movies.id as id, movies.user_id, movies.title, movies.created_at, movies.description, COUNT(case when movie_votes.like=#{type} then 1 end) AS count_likes").joins("LEFT OUTER JOIN movie_votes ON movies.id=movie_votes.movie_id").group("movie_votes.movie_id").order("count_likes DESC")}
end
