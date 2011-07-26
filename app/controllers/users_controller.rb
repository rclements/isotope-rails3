class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update]
  before_filter :require_admin, :only => [:new, :create]

  tab :about

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful!"
      redirect_to about_path(@user)
    else
      flash[:error] = "There was a problem creating the user."
      render :new
    end
  end

  def index
    @users = User.unlocked
  end
  
  def alumni
    @alumni = User.find_all_by_alumni(true)
  end

  def show
    @user = User.find_by_slug(params[:id])
    @posts = Post.for_user(@user).paginate :page => params[:page], :order => 'created_at DESC', :per_page => 5
  end

  def edit
    @user = User.find_by_slug(params[:id])
  end

  def update
    @user = User.find_by_slug(params[:id])

    if admin?
      if params[:user]["locked"] == "true" && !@user.locked_at?
        @user.lock_access!
      elsif params[:user]["locked"] == "false" && @user.locked_at?
        @user.unlock_access!
      end
      if params[:user]["alumni"] == "true"
        @user.alumni = true
        @user.save
      elsif params[:user]["locked"] == "false"
        @user.alumni = false
        @user.save
      end
    else
      flash[:error] = "You must be admin to do that."
      #params[:user]["locked"].delete if params[:user]["locked"]
    end

    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to about_path(@user)
    else
      flash[:error] = "There was a problem updating the user."
      render :edit
    end
  end

  def change_password
    @user = User.find_by_slug(params[:id])
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "The password was updated sucessfully."
      redirect_to :action => :show
    else
      params[:user][:password] = params[:user][:password_confirmation] = ''
      flash.now[:error] = "There was a problem updating the password"
      render :action => :edit
    end
  end


end
