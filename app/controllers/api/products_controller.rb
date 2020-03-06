class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def create
    render "create.json.jb"
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render "show.json.jb"
  end

  def update
    render "update.json.jb"
  end

  def destroy
    render "destroy.json.jb"
  end
end
    