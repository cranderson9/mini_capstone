class Api::ProductsController < ApplicationController
  def index
    # @products = Product.all
    
    # @products = Product.where("name LIKE ?", "%#{params[:name]}%")
    @products = Product.where("price < 10")

    render "index.json.jb"
  end

  

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image_url: params[:image_url]
    )
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    
    @product.name = params[:name] || @product.name 
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url
    
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    Product.find_by(id: params[:id])
    @product.destroy
    render "destroy.json.jb"
  end
end
    