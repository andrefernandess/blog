Rails.application.routes.draw do
  scope "/admin" do
    resources :posts
  end

  root "blog#index"
end
