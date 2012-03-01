class PagesController < ApplicationController
  def home
    @title = "Home"
    @header = "Welcome to Twitter Clone"
    @micropost = Micropost.new if signed_in?
  end

  def contact
    @title = "Contact"
    @header = "Contact Us"
  end

  def about
    @title = "About"
    @header = "About Us"
  end

  def help
    @title = "Help"
    @header = "Help"
  end
end
