Rails.application.routes.draw do
  get("/", { :controller => "photos", :action => "homepage" })
  get("/users", { :controller => "users", :action => "index" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/photos/:path_photo", { :controller => "photos", :action => "show" })
  get("/delete_photo/:toast_id", { :controller => "photos", :action => "bye"})
  get("/update_photo/:update_id", { :controller => "photos", :action => "update"})


  get("/insert_photo_record", { :controller => "photos", :action => "add_photo" })
  get("/insert_user_record", { :controller => "users", :action => "add_user" })
  get("/update_user/:old_username", { :controller => "users", :action => "update_user" })

end
