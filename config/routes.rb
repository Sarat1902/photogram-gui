Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:username", {:controller => "users", :action => "show"})
  post("/add_user/", {:controller => "users", :action => "add_user"})
  post("/update_user/:user_id", {:controller => "users", :action => "update"})



  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:photo_id", {:controller => "photos", :action => "show"})
  post("/update_photo/:photo_id", {:controller => "photos", :action => "update"})
  get("/delete_photo/:photo_id", {:controller => "photos", :action => "delete"})
  post("/insert_photo_record/", {:controller => "photos", :action => "create"})
  post("/add_comment/", {:controller => "photos", :action => "add_comment"})

end
