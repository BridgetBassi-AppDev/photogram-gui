Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/photos/:an_id", { :controller => "photos", :action => "show" })

end
