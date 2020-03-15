class Api::SuppliersController < ApplicationController
  def index
    render "index.json.jb"
  end

  def show
    render "show.json.jb"
  end

  def create
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
