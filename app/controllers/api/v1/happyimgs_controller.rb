class Api::V1::HappyimgsController < ApplicationController
  before_action :find_happyimg, only: [:update, :destroy]

 def index
   @happyimgs = Happyimg.all
   render json: @happyimgs
 end

 def create
   @happyimg = Happyimg.create(happyimg_params)
   render json: @happyimg, status: :accepted
 end

 def update
   @happyimg.update(happyimg_params)
   if @happyimg.save
     render json: @happyimg, status: :accepted
   else
     render json: { errors: @happyimg.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @happyimg.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def happyimg_params
   params.require(:happyimg).permit(:img_url, :user_id)
 end

 def find_happyimg
   @happyimg = Happyimg.find(params[:id])
 end

end
