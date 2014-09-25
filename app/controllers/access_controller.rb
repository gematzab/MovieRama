class AccessController < ApplicationController
  before_action :confirm_logged_in, :except => [:log_in, :attempt_login]

  def log_in
  	#login form
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id]=authorized_user.id
      session[:email]=authorized_user.email
      session[:first_name]=authorized_user.first_name
      session[:last_name]=authorized_user.last_name
      redirect_to(:controller=> 'public', :action => 'index', :id=>session[:user_id])
    else
      flash[:alert] = "Invalid username/password combination."
      redirect_to(:action => 'log_in')
    end
  end

  def logout
    session[:user_id]=nil
      session[:username]=nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "log_in")
  end
end
