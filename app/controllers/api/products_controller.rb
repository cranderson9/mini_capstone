class Api::ProductsController < ApplicationController
  def products_list
    @products = Product.all
    render "product_list.json.jb"
  end

  def product_first
    @product_first = Product.first
    render "product_first.json.jb"
  end

  def product_second
    @product_second = Product.second
    render "product_second.json.jb"
  end

  def any_product
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render "any_product.json.jb"
  end

  def all_products
    @product = Product.first
    render "all_products.json.jb"
  end
end
    