class Api::ProductsController < ApplicationController
  def products_list
    @products = Product.all
    render "product_list.json.jb"
  end

  def product
    render "product.json.jb"
  end
end
