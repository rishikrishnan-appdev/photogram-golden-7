class PhotosController < ApplicationController
    def index
        
        @photo_list = Photo.all
        
        render(:template => "photos_templates/all_photos.html.erb")
    end
    
    def new
        render(:template => "photos_templates/new_photo.html.erb")
    end
    
    def create
        
        inputs = params
        
        p = Photo.new
        p.source = inputs[:the_source]
        p.caption = inputs[:the_caption]
        p.save
        
        redirect_to("/photos")
    end
    
    def access_photo
        
        id = params["id"].to_i
        @photo = Photo.find(id)
        
        render(:template => "photos_templates/access_photo.html.erb")
    end
    
    def edit_photo
        
        id = params["id"].to_i
        
        @photo = Photo.find(id)
        
        render(:template => "photos_templates/edit_photo.html.erb")
    end
    
    def update
        
        inputs = params
        
        p = Photo.find(inputs[:id])
        p.source = inputs[:the_source]
        p.caption = inputs[:the_caption]
        p.save
        
        redirect_to("/photos/" + inputs[:id].to_s)
    end
    
    def delete_photo
        
        id = params.fetch("id")
        photo = Photo.find(id)
        photo.destroy
        redirect_to("/photos")
    end
    
end