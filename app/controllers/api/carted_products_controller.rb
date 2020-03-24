class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      status: params[:status], 
      user_id: params[:user_id], 
      product_id: params[:product_id], 
      quantity: params[:quantity],
      order_id: params[:order_id]
    )
    if current_user
      @carted_product.save
      render "show.json.jb"
    
    end
  end

  def index
    # @carted_products = CartedProduct.all
    if current_user
      @carted_products = current_user.carted_products
      render "index.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end
end
