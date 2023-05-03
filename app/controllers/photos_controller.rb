class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :asc})
    render({ :template => "photo_templates/index"})
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :id => url_username})
    @the_user = matching_usernames.at(0)
    render({ :template => "photo_templates/show.html.erb"})
  end

end
