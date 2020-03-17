class Api::ProductsController < ApplicationController
  def index
    # @products = Product.where("price < 10")
    # @products = Product.where('name LIKE ?', "%#{params[:search]}%")

    # if params[:discount] == 'true'
    #   @products = @products.where("price < 10")
    # end

    # if params[:sort] && params[:sort_order]
    #   @products = @products.order(params[:sort] => params[:sort_order])
    # else
    #   @products = @products.order(:id)
    # end

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
      image_url: params[:image_url],
      supplier_id: params[:supplier_id]
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
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    
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
    