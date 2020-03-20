class Api::OrdersController < ApplicationController
  
  
  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
  end

  def index
    if current_user
      @orders = Order.all
      @orders = current_user.orders
      render "index.json.jb"
    else
      render json: {}, status: :unauthorized
    end
    
  end
  
  def create
    if current_user
      product = Product.find_by(id: params[:product_id])
      the_subtotal = params[:quantity].to_i * product.price
      tax = 0.09
      the_tax = the_subtotal * tax
      the_total = the_subtotal + the_tax

      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: the_subtotal,
        tax: the_tax,
        total: the_total
      )
      @order.save
      render "show.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    @order = Order.find_by(id: params[:id])
    @order.user_id = current_user.id || @order.user_id
    @order.product_id = params[:product_id] || @order.product_id
    @order.quantity = params[:quantity] || @order.quantity
    @order.subtotal = params[:subtotal] || @order.subtotal
    @order.tax = params[:tax] || @order.tax
    @order.total = params[:total] || @order.total
    @order.save
    render "show.json.jb"
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    @order.destroy
    render json: {message: "Your order has been deleted"}
  end
end
