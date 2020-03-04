class Api::ProductsController < ApplicationController
  def products_list
    @products = Product.all
    render "product_list.json.jb"
  end
end
