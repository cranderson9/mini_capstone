class Api::CartedProductsController < ApplicationController
  def index
    # @carted_products = CartedProduct.all
    if current_user
      @carted_products = current_user.carted_products.where(status: "carted")
      render "index.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end
  
  def create
    @carted_product = CartedProduct.new(
      status: "carted", 
      user_id: current_user.id, 
      product_id: params[:product_id], 
      quantity: params[:quantity],
    )
    if current_user
      @carted_product.save
      render "show.json.jb"
    end
  end

  def destroy
    
    @carted_product.update
  end
  
end
