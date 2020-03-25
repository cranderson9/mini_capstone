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
    @carted_products = current_user.carted_products.where(status: "carted")

    subtotal = 0
    @carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end
    tax_rate = 0.09
    tax = subtotal * tax_rate
    total = subtotal + tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if current_user
      @order.save
      @carted_products.each do |carted_product|
        carted_product.update(order_id: @order_id, status: "purchased")
      end
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
