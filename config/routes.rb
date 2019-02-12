Rails.application.routes.draw do
  
  get("/photos/new", {:controller => "photos", :action => "new"})
  get("/create_photo", {:controller => "photos", :action => "create"})
  
  get("/photos", {:controller => "photos", :action => "index"})
  get("/", {:controller => "photos", :action => "index"})
  get("/photos/:id", {:controller => "photos", :action => "access_photo"})
  
  get("/photos/:id/edit", {:controller => "photos", :action => "edit_photo"})
  get("/update_photo/:id", {:controller => "photos", :action => "update"})
  
  get("/delete_photo/:id", {:controller => "photos", :action => "delete_photo"})
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
