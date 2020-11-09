class  UsersController< ApplicationController
  def index
    matching_users = User.all
    @list_of_users= matching_users.order({:username => :asc})
    render({:template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("path_name")
    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.first

    render({:template => "user_templates/show.html.erb"})
   
  end

  def create
    new_username = params.fetch("input_username")

    new_user = User.new
    new_user.username=new_username
    new_user.id = User.all.length + 82

    new_user.save

    redirect_to("/users/" + new_username)
  

  end

  def update
  new_username = params.fetch("input_username")
  current_username = params.fetch("current_username").to_s[1..-1]
  if(new_username == current_username)
    redirect_to("/users/"+current_username)
  else
    matching_usernames = User.where({:username => current_username})
    the_user = matching_usernames.first
    the_user.username=new_username
    the_user.save
    
    redirect_to("/users/"+new_username)
    #render({:template => "user_templates/create.html.erb"})
  end
  end
end