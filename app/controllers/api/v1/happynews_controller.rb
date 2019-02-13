class Api::V1::HappynewsController < ApplicationController
  before_action :find_happynew, only: [:update, :destroy]

 def index
   @happynews = Happynew.all
   render json: @happynews
 end

 def create
   @happynew = Happynew.create(happynew_params)
   render json: @happynew, status: :accepted
 end

 def update
   @happynew.update(happynew_params)
   if @happynew.save
     render json: @happynew, status: :accepted
   else
     render json: { errors: @happynew.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @happynew.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def happynew_params
   params.require(:happynews).permit(:news_src, :title, :description)
 end

 def find_happynew
   @happynew = Happynew.find(params[:id])
 end

end
