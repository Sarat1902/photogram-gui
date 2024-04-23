Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})
  get("/", {:controller => "users", :action => "show"})


end
