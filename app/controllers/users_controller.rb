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
end
