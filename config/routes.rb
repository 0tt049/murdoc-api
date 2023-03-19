Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/classes/:ancestry_depth' , to: 'nodes#classes_at_depth'
      get '/subclasses/:id' , to: 'nodes#subclasses'
      get '/ancestry/:id' , to: 'nodes#path_to_root'
      get '/class/instance_methods/:id' , to: 'nodes#instance_methods'
      get '/class/methods/:id' , to: 'nodes#methods'
      get '/doc/:id' , to: 'nodes#show_doc'
    end
  end
end
