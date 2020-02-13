class UsersController < ApplicationController
  layout 'application'

  def index
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      
      end
    if authorized_user
    
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are logged in. as #{params[:username]}"
      redirect_to(posts_path)

    else
      flash[:notice]="Wrong Username/password combination"
      render('index')
    end
    end
  end
  

  def show
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(users_params)
    if @user.save
      UserMailer.with(user: @user).signup_confirmation.deliver_now
      #if save succeeds, redirect to index actions
      flash[:notice] = "Sign up successfully login now"
      redirect_to(users_path)
    else
      #if save fails, redirect to the form page to fix
      render('new')
    end
  end

  def edit

  end

  def delete
  end

  def logout
    session[:username]= nil
    flash[:notice]='Logged out'
    redirect_to(users_path)
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :password, :username, :email,:attachment)
  end
end
