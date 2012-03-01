class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  def index
    @title = "All users"
    @header= "All users"
    @users = User.all
    #@users=User.paginate(:page => params[:page], :per_page => 30)
  end
  def show
    @header = "Personal Information"
    #@title = @user.name
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  def new
    @title = "Sign up"
    @header = "Sign up"
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      sign_in @user
      flash[:success] = "Welcome to the Twitter Clone!"
      redirect_to @user
    else
      @title = "Sign up"
      @header = "Sign up"
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
    @header = "Edit Information"
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      @header = "Edit Information"
      render 'edit'
    end
  end
  def following
    @title = "Following"
    @user = User.find(params[:id])
    #@users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    #@users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
  private

    def authenticate
      deny_access unless signed_in?
    end
end
