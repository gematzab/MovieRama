class PublicController < ApplicationController
  
  def index

    if params[:sort_likes]
      @movies = Movie.order_by_likes_or_hates(params[:sort_likes])
      # query = "SELECT *, COUNT(case when movie_votes.like = 1 then 1 end) AS count_likes 
      #FROM movies
      #LEFT OUTER JOIN movie_votes  
      #ON movie_votes.movie_id = movies.id
      #GROUP BY movie_id 
      #ORDER BY count_likes DESC"
      #@results = ActiveRecord::Base.connection.exec_query(query); 
      #@results2 = Movie.select("*, COUNT(case when 'movie_votes'.'like'=1 then 1 end) AS count_likes").joins("LEFT OUTER JOIN 'movie_votes' ON 'movies'.'id'='movie_votes'.'movie_id'").group("'movie_votes'.'movie_id'")
      #results2 = Movie.select("*, COUNT(case when movie_votes.like=1 then 1 end) AS count_likes").joins("LEFT OUTER JOIN movie_votes ON movies.id=movie_votes.movie_id").group("movie_votes.movie_id")
    else
      @movies = Movie.scope_sort_by_selection_by_user(params[:sort], params[:userid])
    end
    if session[:user_id]
      @movies_who_voted = MovieVote.where(:user_id=>session[:user_id]).group_by { |a| a.movie_id}
    end
  end
end
