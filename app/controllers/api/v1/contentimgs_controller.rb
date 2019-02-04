class Api::V1::ContentimgsController < ApplicationController
  before_action :find_contentimg, only: [:update, :destroy]

 def index
   @contentimgs = Contentimg.all
   render json: @contentimgs
 end

 def create
   @contentimg = Contentimg.create(contentimg_params)
   render json: @contentimg, status: :accepted
 end

 def update
   @contentimg.update(contentimg_params)
   if @contentimg.save
     render json: @contentimg, status: :accepted
   else
     render json: { errors: @contentimg.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @contentimg.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def contentimg_params
   params.require(:contentimg).permit(:img_url, :user_id)
 end

 def find_contentimg
   @contentimg = Contentimg.find(params[:id])
 end

end
