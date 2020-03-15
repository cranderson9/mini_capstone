class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "index.json.jb"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])  
    render "show.json.jb"
  end

  def create
    Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    
    render "show.json.jb"
  end

  def update
    render "show.json.jb"
  end

  def destroy
    @supplier.destroy
    render json: {message: "Supplier successfuly deleted."}
  end
end
