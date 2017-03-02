class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!

    if @user.save
      session[:user_id] = @user.id.to_s
      flash[:notice] = "You have successfully joined the Expat Connection Community!"
      redirect_to posts_path
    else
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    redirect_to users_path unless @user == current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    session.delete(:user_id)
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
    end
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :profile_photo, :email, :password, :age, :home_city, :home_country, :current_city, :language, :second_language, :third_language, :bio)
  end
end
