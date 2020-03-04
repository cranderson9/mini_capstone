class Api::ProductsController < ApplicationController
  def products_list
    render "product_list.json.jb"
  end
end
