class Api::ImagesController < ApplicationController
  def create
  @image = Image.new(
    url: params[:url],
    product_id: params[:product_id]
  )
  @image.save!
  render json: {message: "Image created successfully."}
  end

  def destroy
    @image = Image.find_by(id: params[:id]) 
    @image.destroy
    render json: {message: "Image successfuly deleted."}
  end
end
