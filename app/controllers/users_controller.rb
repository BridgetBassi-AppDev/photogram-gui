class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({ :template => "templates/index"})
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})
    @the_user = matching_usernames.at(0)
    render({ :template => "templates/show.html.erb"})
  end

  def update_user
    new_user = params.fetch("input_username")

    the_id = params.fetch("old_username")
    matching_users = User.where({ :username => the_id})
    @the_user = matching_users.at(0)
    @the_user.username = new_user
    @the_user.save
    next_url = "/users/" + new_user
    redirect_to(next_url)
  end 

  def add_user
    a_new_user = User.new
    a_new_user.username = params.fetch("input_username")
    a_new_user.save
    @the_user = a_new_user
    next_url = "/users/" + a_new_user.username
    redirect_to(next_url)

  end

end
