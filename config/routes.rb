SampleReactRailsApp::Application.routes.draw do
  resources :quiz
  root :to => redirect("/quiz")
end
