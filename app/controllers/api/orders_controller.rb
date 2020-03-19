class Api::OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
  end

  def index
    @orders = Order.all
    if current_user
      @orders = current_user.orders
    else
      @orders = []
    end
    render "index.json.jb"
  end
  
  def create
    @order = Order.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
    @order.save
    render "show.json.jb"
  end

  def update
    @order = Order.find_by(id: params[:id])
    @order.user_id = params[:user_id] || @order.user_id
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
