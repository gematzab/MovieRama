class UsersController < ApplicationController  
  before_action :confirm_logged_in,  :except => [:sign_up, :create]
  

  def sign_up
  	@user=User.new()
  end

  def create

    @user=User.new(user_params)

    if @user.save
      flash[:notice]="User created successfully"
      redirect_to(:controller=>'access', :action=>'log_in')
    else
      render('sign_up')
    end

  end
end

  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
