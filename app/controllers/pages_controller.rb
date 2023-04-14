class PagesController < ApplicationController

  # if you're logged in and hit "home" you won't go back to the root route since there really isn't a whole lot going on there anyway.
  def home
    redirect_to articles_path if logged_in?
  end

  def about
  end
end
