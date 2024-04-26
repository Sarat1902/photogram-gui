class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({:template => "photos_templates/index"})
  end

  def show
    url_id = params.fetch("photo_id")
    matching_photo = Photo.where({:id => url_id})
    @the_photo = matching_photo.at(0)
    render({:template => "photos_templates/show"})
  end

  def update
    url_id = params.fetch("photo_id")
    matching_photo = Photo.where({:id => url_id})
    @the_photo = matching_photo.at(0)
  
    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    @the_photo.save
    redirect_to("/photos/" + @the_photo.id.to_s)

  end

  def delete
    url_id = params.fetch("photo_id")
    matching_photo = Photo.where({:id => url_id})
    @the_photo = matching_photo.at(0)
    @the_photo.destroy
    redirect_to("/photos")
  end
 
  def create
    the_photo = Photo.new
    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")
    the_photo.owner_id = params.fetch("input_owner_id")

    the_photo.save
    redirect_to("/photos")
  end

  def add_comment
   
    comment = Comment.new
    url_id = params.fetch("input_photo_id")
    comment.photo_id = params.fetch("input_photo_id")
    comment.body = params.fetch("input_comment")
    comment.author_id = params.fetch("input_author_id")

    comment.save
    redirect_to("/photos/" + url_id.to_s)
  end


end
