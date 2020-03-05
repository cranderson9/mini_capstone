Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    get "/product_list" => "products#products_list"
    get "/product_first" => "products#product_first"
    get "/product_second" => "products#product_second"
    get "/any_product" => "products#any_product"
    get "/all_products/:name" => "products#all_products"
  end
end
