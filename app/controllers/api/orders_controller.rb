class Api::OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
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
    render json: {order_status: "We got your order. Thanks!"}
    render "show.json.jb"
  end
end
