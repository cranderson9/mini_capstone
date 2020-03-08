class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render "show.json.jb"
  end

  

  def create
    @product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      image_url: params[:input_image_url]
    )
    @product.save
    render "show.json.jb"
  end

  def update
    the_id = params[:id]
    @product = Product.find_by(id: the_id) 
    
    @product.name = params[:name] || @product.name 
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url
    
    @product.save
    render "show.json.jb"
  end

  def destroy
    the_id = params[:id]
    @product = Product.find_by(id: the_id)

    @product.destroy
    render "destroy.json.jb"
  end
end
    