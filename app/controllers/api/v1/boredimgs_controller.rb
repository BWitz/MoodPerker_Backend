class Api::V1::BoredimgsController < ApplicationController
  before_action :find_boredimg, only: [:update, :destroy]

 def index
   @boredimgs = Boredimg.all
   render json: @boredimgs
 end

 def create
   @boredimg = Boredimg.create(boredimg_params)
   render json: @boredimg, status: :accepted
 end

 def update
   @boredimg.update(boredimg_params)
   if @boredimg.save
     render json: @boredimg, status: :accepted
   else
     render json: { errors: @boredimg.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @boredimg.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def boredimg_params
   params.require(:boredimg).permit(:img_url, :user_id)
 end

 def find_boredimg
   @boredimg = Boredimg.find(params[:id])
 end

end
