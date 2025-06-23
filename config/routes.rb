Rails.application.routes.draw do
  namespace :api do
    get "/convert", to: "converter#convert"
  end
end
