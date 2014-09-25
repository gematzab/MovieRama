class MoviesController < ApplicationController
before_action :confirm_logged_in

  def New
  	@movie=Movie.new()
  	@user= User.find(params[:id])
  end

  def create
    @movie = Movie.new(deal_params)
    @user= User.find(params[:user_id])
    if @movie.save
      @user.movies << @movie
      redirect_to(:controller=>'public', :action=>'index', :id=> @user.id)
    else
      render('New')
    end
  end

	private
	def deal_params
	  params.require(:movie).permit(:title, :description, :user_id)
	end
end