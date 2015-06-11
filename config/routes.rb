Rails.application.routes.draw do
  
  get "/"=> "dashboard#index"

  get "/students"=> "students#index"
  get "/students/new"=> "students#new"
  post "/students/create"=>"students#create"
  post "/students/save"=>"students#save"
  get "/students/:id/edit"=> "students#edit"
  get "/students/find" => "students#find"

  get "/courses"=> "courses#index"
  get "/courses/new"=> "courses#new"
  post "/courses/create"=>"courses#create"
  post "/courses/save"=>"courses#save"
  get "/courses/:id/edit"=> "courses#edit"


  get "/classrooms"=> "class_rooms#index"
  get "/classrooms/new"=> "class_rooms#new"
  post "/classrooms/create"=>"class_rooms#create"
  post "/classrooms/save"=>"class_rooms#save"
  get "/classrooms/:id/edit"=> "class_rooms#edit"

end
