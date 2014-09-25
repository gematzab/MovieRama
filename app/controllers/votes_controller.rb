class VotesController < ApplicationController
	before_action :confirm_logged_in
	respond_to :html, :js
	def like_hate
		@movie= Movie.find(params[:movie_id])
		if movie_vote = MovieVote.where(:user_id => params[:user_id], :movie_id => params[:movie_id]).first
			movie_vote.update_attributes(vote_params)
		else
			movie_like_hate = MovieVote.new(vote_params)
			@user= User.find(params[:user_id])
		    if movie_like_hate.save
		    	@user.movie_votes << movie_like_hate
		    	@movie.movie_votes << movie_like_hate
		      flash[:notice]="Voted successfully"
		    end  
	  	end
	  	@movies_who_voted = MovieVote.where(:user_id=>session[:user_id]).group_by { |a| a.movie_id}
	  	@likew=@movie.movie_votes.where(:like=>true).size
	  	@hatew=@movie.movie_votes.where(:like=>false).size
	  	respond_to do |format|
    		format.js { render :movie_votes }
  		end
	end

	def unvote
		@movie_vote = MovieVote.find(params[:id])
		@movie= Movie.find(@movie_vote.movie_id)
		@movie_vote.destroy
		flash[:notice]="UnVoted successfully"
		@movies_who_voted = MovieVote.where(:user_id=>session[:user_id]).group_by { |a| a.movie_id}
	  	@likew=@movie.movie_votes.where(:like=>true).size
	  	@hatew=@movie.movie_votes.where(:like=>false).size
	  	respond_to do |format|
    		format.js { render :movie_votes }
    	end
	end

end
private
    def vote_params
       params.permit(:user_id, :movie_id, :like)
    end