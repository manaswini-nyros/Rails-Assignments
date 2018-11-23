Rails.application.routes.draw do
  root to:"samples#home"	
  get '/home' => "samples#home"
  get '/boardings/boardingpass' => "boardings#boardingpass"
end
