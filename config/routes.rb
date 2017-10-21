SampleReactRailsApp::Application.routes.draw do

  get 'results/' => 'results#view'
  resources :quiz
  root :to => redirect("/quiz")
end
