class Api::V1::SadimgsController < ApplicationController
  before_action :find_sadimg, only: [:update, :destroy]

 def index
   @sadimgs = Sadimg.all
   render json: @sadimgs
 end

 def create
   @sadimg = Sadimg.create(sadimg_params)
   render json: @sadimg, status: :accepted
 end

 def update
   @sadimg.update(sadimg_params)
   if @sadimg.save
     render json: @sadimg, status: :accepted
   else
     render json: { errors: @sadimg.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @sadimg.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def sadimg_params
   params.require(:sadimg).permit(:img_url, :user_id)
 end

 def find_sadimg
   @sadimg = Sadimg.find(params[:id])
 end

end
