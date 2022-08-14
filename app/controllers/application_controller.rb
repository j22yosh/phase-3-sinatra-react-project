class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  #USER CRUD ROUTES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  get "/users" do
    user = User.all
    user.to_json(include: :tasks)
  end
  post "/users" do
    user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name]
    )
    user.to_json
  end
  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(
      first_name: params[:first_name],
      last_name: params[:last_name]
    )
    user.to_json
  end
  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end
  #TASK CRUD ROUTES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  get "/tasks" do
    task = Task.all
    task.to_json
  end
  post "/tasks" do
    task = Task.create(
      task_name: params[:task_name],
      category_id: params[:category_id],
      user_id: params[:user_id],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    task.to_json
  end
  patch '/tasks/:id' do
     task = Task.find(params[:id])
    task.update(
      task_name: params[:task_name],
      category_id: params[:category_id],
      user_id: params[:user_id],
      created_at: params[:created_at],
      updated_at: params[:updated_at]
    )
    task.to_json
  end
  delete '/tasks/:id' do
    task = Task.find(params[:id])
    task.destroy
    task.to_json
  end
  
 #CATEGORY CRUD ROUTES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 get "/categories" do
  ct = Category.all
  ct.to_json
end
post "/categories" do
  ct = Category.create(
    category_name: params[:category_name]
      )
  ct.to_json
end
patch '/categories/:id' do
  ct = Category.find(params[:id])
  ct.update(
    category_name: params[:category_name]
    )
  ct.to_json
end
delete '/categories/:id' do
  ct = Category.find(params[:id])
  ct.destroy
  ct.to_json
end

end
