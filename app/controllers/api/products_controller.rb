class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
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
    @product.update(
      @product.name = params[:name] || @product.name 
      @product.price = params[:price] || @product.price
      @product.description = params[:description] || @product.description
      @product.image_url = params[:image_url] || @product.image_url
    )
    if @product.save
      render "show.json.jb"
      else
        render json: {errors: @product.errors.full_messages}
    end
  end

  def destroy
    the_id = params[:id]
    @product = Product.find_by(id: the_id)

    @product.destroy
    render "destroy.json.jb"
  end
end
    