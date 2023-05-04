class PhotosController < ApplicationController
  def homepage
    redirect_to("/users")
  end
  
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({ :template => "photo_templates/index"})
  end

  def show
    url_photo = params.fetch("path_photo")
    matching_photos = Photo.where({ :id => url_photo})
    @the_photo = matching_photos.at(0)
    render({ :template => "photo_templates/show.html.erb"})
  end

  def bye
    the_id = params.fetch("toast_id")
    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)
    the_photo.destroy


    redirect_to("/photos")

  end

  def update
    the_id = params.fetch("update_id")
    matching_photos = Photo.where({ :id => the_id})
    @the_photo = matching_photos.at(0)
    @the_photo.caption = params.fetch("input_caption")
    @the_photo.image = params.fetch("input_image")
    @the_photo.save
    render({ :template => "photo_templates/show.html.erb"})
  end


  def add_photo
    a_new_photo = Photo.new
    a_new_photo.owner_id = params.fetch("input_owner_id")

    a_new_photo.caption = params.fetch("input_caption")
    a_new_photo.image = params.fetch("input_image")
    a_new_photo.save
    @the_photo = a_new_photo
    next_url = "/photos/" + a_new_photo.id.to_s
    redirect_to(next_url)
  end

end
