class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:user_name => :asc})
    render({:template => "user_templates/index"})
  end

  def show
    url_username = params.fetch("username")
    @my_id = User.where({:username => url_username}).at(0).id
    
    matching_username = User.where({:username => url_username})
    @the_user = matching_username.at(0)

    if @the_user == nil
       redirect_to("/")
    else
      render({:template => "user_templates/show"})
    end 
  end

  def add_user
    user = User.new
    user.username = params.fetch("input_username")
    user.save
    redirect_to("/users/" + user.username)
  end

  def update
    url_id = params.fetch("user_id")
    user = User.where({:id => url_id }).at(0)
   
    user.username = params.fetch("input_username")
    user.save

    redirect_to("/users/" + user.username)
  end
end
