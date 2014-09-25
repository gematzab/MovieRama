class PublicController < ApplicationController
  
  def index

    if params[:sort_likes]
      @movies = Movie.order_by_likes_or_hates(params[:sort_likes])
    elsif params[:sort] || params[:userid]
      @movies = Movie.scope_sort_by_selection_by_user(params[:sort], params[:userid])
    else
      @movies = Movie.all
    end

    if session[:user_id]
      @movies_who_voted = MovieVote.where(:user_id=>session[:user_id]).group_by { |a| a.movie_id}
    end
  end
end
