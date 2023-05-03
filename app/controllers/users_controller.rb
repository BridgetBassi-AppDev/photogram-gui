class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({ :template => "templates/index"})
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :id => url_username})
    @the_user = matching_usernames.at(0)
    render({ :template => "templates/show.html.erb"})
  end

end
